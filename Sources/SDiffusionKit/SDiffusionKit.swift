import Foundation
import UIKit

final public class SDiffusionKit {
    let token:String
    var configuration: SDiffusionConfig
    
    /// Init
    /// - Parameter token: Replicate API token
    public init(_ token:String) {
        self.token = token
        self.configuration = SDiffusionMiniDalleConfig()
    }
    
    /// Init
    /// - Parameters:
    ///   - token: Replicate API token
    ///   - configuration: Model configuration
    public init(usingToken token:String, configuration:SDiffusionConfig){
        self.token = token
        self.configuration = configuration
    }
    
    /// Text2Img - Make the IA imagine something
    /// - Parameter prompt: text prompt
    /// - Returns: Array of imagined images as UIImage
    public func imagine(_ prompt:String) async throws->[UIImage]{
        let request = buildRequestFrom(prompt, using: self.configuration)
        
        let predictionResponse = try await
            makePredicton(fromRequest: request)
        
        var urlList = try await
            getPredictionInfo(from: predictionResponse, using: self.configuration).getImageStringUrl()
        
        
        var timeoutCounter = 0
        while(urlList.count != configuration.numberOfExpectedImages || timeoutCounter>configuration.timoutToGetImages){
            try await Task.sleep(nanoseconds: 1_000_000_000)
            urlList = try await getPredictionInfo(from: predictionResponse, using: self.configuration).getImageStringUrl()
        
            timeoutCounter += 1
        }
        
        
        let images = try await
            getImagesFromURLs(urlList)
        
        return images
        
    }
    
    /// Build a HTTP request to use in ReplicateAPI
    /// - Parameters:
    ///   - prompt: Prompt to be used in this prediction
    ///   - config: Model Configuration
    /// - Returns: URL Request to be send
    private func buildRequestFrom(_ prompt:String, using config:SDiffusionConfig)->URLRequest{
        var request = URLRequest(url: SDiffusionKit.Constants.predictionURL!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(self.token)", forHTTPHeaderField: "Authorization")
        request.httpBody = config.asHttpBodyData(usingPrompt: prompt)
        return request
    }
    
    /// In order to check if our prediction is being made we have to fetch some information about it. This function builds the request to fetch the image URLs
    /// - Parameter id: prediction ID given by Replicate
    /// - Returns: URL request
    private func buildRequestToGetUrlImage(ofID id:String)->URLRequest{
        let requestUrl = URL(string: "https://api.replicate.com/v1/predictions/\(id)")
        var request = URLRequest(url: requestUrl!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token \(self.token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    /// Send a prediction to be made in the ReplicateAPI
    /// - Parameter request: URL request to be made
    /// - Returns: Returns the response parsed as a struct
    private func makePredicton(fromRequest request:URLRequest)async throws->PredictionResponse{
        let (data,response) = try! await URLSession.shared.data(for:request)
        guard (response as? HTTPURLResponse)?.statusCode == 201 else {
            let jsonResponse = try JSONSerialization.jsonObject(with:data, options: [])
            dump(jsonResponse)
            fatalError("Error while fetching data")
        }
        
        let decoder = JSONDecoder()
        let objResponse = try decoder.decode(PredictionResponse.self, from: data)
        
        return objResponse
    }
    
    /// Retrive the information of a prediction made before
    /// - Parameters:
    ///   - predictionResponse: Respose of when the desired prediction was made
    ///   - config: model to parse the respose
    /// - Returns: PredcitonInfo
    private func getPredictionInfo(from predictionResponse:PredictionResponse, using config:SDiffusionConfig) async throws->PredictionInfo{
        let request = buildRequestToGetUrlImage(ofID: predictionResponse.id!)
        
        let (data,response) = try await URLSession.shared.data(for:request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
        
        switch config.usedModel {
        case .DalleMini:
            let dalleMiniPredictionInfo = try DalleMiniPredictionInfo(data: data)
            return dalleMiniPredictionInfo
        case .StableDiffusion:
            fatalError("This model is not implemented yet")
        }
    }
    
    /// Image downloader Handler
    /// - Parameter urlString: Image URL
    /// - Returns: image as UIImage
    private func downloadImage(urlString:String) async throws->UIImage{
        let request = URLRequest(url:URL(string: urlString)!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Could not found \(urlString)") }
        
        if let image = UIImage(data: data){
            return image
        }else{
            fatalError("Could not found \(urlString)")
        }
    }
    
    /// Transforms a list of images URLs (string) into UIImages
    /// - Parameter urlList: URLs of the images
    /// - Returns: Array of UIimages
    private func getImagesFromURLs(_ urlList:[String]) async throws->[UIImage]{
        var imageList:[UIImage] = []
        
        for urlString in urlList{
            let image = try await downloadImage(urlString: urlString)
            imageList.append(image)
        }
        print(urlList)
        return imageList
    }

}
