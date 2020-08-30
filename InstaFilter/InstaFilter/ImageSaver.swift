//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by Nikhi on 30/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    
    @objc func saveError(_ image: UIImage, didSavefinishingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished!")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
    
}
