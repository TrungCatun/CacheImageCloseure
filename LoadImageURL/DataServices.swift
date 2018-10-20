//
//  DataServices.swift
//  LoadImageURL
//
//  Created by Trung on 10/15/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import Foundation

//extension Notification.Name {
//    static let didGetData                 = Notification.Name("didGetData")
//    static let didGetError                 = Notification.Name("didGetError")
//
//}


class DataServices {
    static var shared = DataServices()
    var cache = NSCache<NSString, NSData>()
    
   
    func getImage(urlString: String, completeHandler: @escaping (Data) -> Void , errorHandler: @escaping () -> Void) {
        if let imageData = cache.object(forKey: urlString as NSString) as Data? {
            completeHandler(imageData)
        } else {
            getImageData(from: urlString, completeHandler: completeHandler, errorHandler: errorHandler)
        }
       
    }
    
    
    private func getImageData(from urlString: String, completeHandler: @escaping (Data) -> Void,  errorHandler: @escaping () -> Void) {
        let imageUrl: URL = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            
            guard error == nil, data != nil else {
                print(error!.localizedDescription)
                errorHandler()
                return
            }
            DispatchQueue.main.async {
                self.cache.setObject(data! as NSData, forKey: urlString as NSString)
                completeHandler(data!)
            }
        }.resume()
    }
}
