////https://gist.github.com/networkextension/654882c1283a7b0b6cb3117f91b8c948
//
//import Foundation
//import SwiftUI
//import UIKit
//
//extension UIImage {
//    @available(iOS 15, *)
//    var thumbnail: UIImage? {
//        get async {
//            let size = CGSize(width: 80, height: 40)
//            return await self.byPreparingThumbnail(ofSize: size)
//        }
//    }
//}
//enum FetchError:Error{
//    case badID
//    case badImage
//    
//}
//actor ImageDownloader {
//    
//    private enum CacheEntry {
//        case inProgress(Task<Image, Error>)
//        case ready(Image)
//    }
//    
//    private var cache: [URL: CacheEntry] = [:]
//    
//    func image(from url: URL) async throws -> Image? {
//        if let cached = cache[url] {
//            switch cached {
//                case .ready(let image):
//                    return image
//                case .inProgress(let handle):
//                    return try await handle.get()
//            }
//        }
//        
//        let handle = async {
//            try await downloadImage(from: url)
//        }
//        
//        cache[url] = .inProgress(handle)
//        
//        do {
//            let image = try await handle.get()
//            cache[url] = .ready(image)
//            return image
//        } catch {
//            cache[url] = nil
//            throw error
//        }
//    }
//    //URL.init(string:"https://www.apple.com/v/home/hc/images/overview/ios15_logo__cnpdxsz7otzm_large_2x.png")!)
//    func downloadImage(from url:URL) async throws -> Image{
//        let request = URLRequest.init(url:url)
//        let (data, response) = try await URLSession.shared.data(for: request)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badID }
//        let maybeImage = UIImage(data: data)
//        guard let thumbnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
//        return  Image(uiImage: thumbnail)
//    }
//}
