//
//  ViewController.swift
//  LoadImageURL
//
//  Created by Trung on 10/11/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let imageUrlString = "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/as07-11-2022.jpg"
        DataServices.shared.getImage(urlString: imageUrlString, completeHandler: didGetImage, errorHandler: getError)
//        didGetImage(data: <#T##Data#>)
    }
    
  
//    @objc
//    func updateImage(_ notification: Notification) {
//        guard let imageData = notification.userInfo?["image"] as? Data else {return}
//        let image = UIImage(data: imageData)
//        imageView.image = image
//        indicator.stopAnimating()
//    }
//
//        @objc
    func getError() {
            indicator.stopAnimating()
    }

    func didGetImage(data: Data) {
        let image = UIImage(data: data)
        imageView.image = image
        indicator.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        DataServices.shared.cache.removeAllObjects()
    }
    
   
    
    
    
    
    
   


}

