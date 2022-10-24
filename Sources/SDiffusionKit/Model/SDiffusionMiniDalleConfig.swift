//
//  SDiffusionDalleConfig.swift
//  
//
//  Created by Joao Pedro Monteiro Maia on 21/10/22.
//

import Foundation


public struct SDiffusionMiniDalleConfig:SDiffusionConfig {
    public var usedModel: SDiffusionModel
    public var saveAsPng:Bool
    public var progressiveOutputs:Bool
    public var seamless:Bool
    public var gridSize:Int
    public var temperature:Float
    public var topK:Int
    public var superconditionFactor:Int

    public var numberOfExpectedImages: Int
    public var timoutToGetImages: Int
    
    
    
    /// Dall-E Mini configuration
    /// - Parameters:
    ///   - saveAsPng: If selected, the image is saved in lossless png format, otherwise jpg.
    ///   - progressiveOutputs: Show intermediate outputs while running. This adds less than a second to the run time.
    ///   - seamless: Tile images in token space instead of pixel space. This has the effect of blending the images at the borders.
    ///   - gridSize: Size of the image grid. 5x5 takes about 15 seconds, 9x9 takes about 40 seconds.
    ///   - temperature: High temperature increases the probability of sampling low scoring image tokens.
    ///   - topK: Each image token is sampled from the top-k scoring tokens.
    ///   - superconditionFactor: Higher values can result in better agreement with the text.
    ///   - numberOfExpectedImages: How many images this model generates
    ///   - timoutToGetImages: Timeout to get Images
    init(saveAsPng: Bool = false,
         progressiveOutputs: Bool = false,
         seamless: Bool = false,
         gridSize: Int = 1,
         temperature: Float = 1,
         topK: Int = 128,
         superconditionFactor: Int = 16,
         numberOfExpectedImages:Int = 1,
         timoutToGetImages:Int = 120) {
        
        self.usedModel = SDiffusionModel.DalleMini
        self.saveAsPng = saveAsPng
        self.progressiveOutputs = progressiveOutputs
        self.seamless = seamless
        self.gridSize = gridSize
        self.temperature = temperature
        self.topK = topK
        self.superconditionFactor = superconditionFactor
        
        self.numberOfExpectedImages = numberOfExpectedImages
        self.timoutToGetImages = timoutToGetImages
    }
    
    
    /// Returns the HTTP request representing this configuration
    /// - Parameter prompt: prompt to be used
    /// - Returns: HTTP request body as data
    public func asHttpBodyData(usingPrompt prompt: String) -> Data {
        let bodyAsJson:[String: Any] = [
            "version": usedModel.rawValue,
            "input": ["text":prompt,
                      "save_as_png":saveAsPng.description,
                      "progressive_outputs":progressiveOutputs.description,
                      "seamless":seamless.description,
                      "grid_size":gridSize.description,
                      "temperature":temperature.description,
                      "top_k":topK.description,
                      "supercondition_factor":superconditionFactor.description
                     ]
        ]
        
        return try! JSONSerialization.data(withJSONObject: bodyAsJson)
    }

    
    
}
