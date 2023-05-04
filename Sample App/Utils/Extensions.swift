//
//  Extensions.swift
//  Sample App
//
//  Created by Raees  on 04/05/2023.
//  Copyright © 2023 Sample. All rights reserved.
//
import SDWebImage
import Foundation

extension UIImageView{
    func load(url:URL?){
        sd_imageIndicator   =   SDWebImageActivityIndicator.grayLarge
        sd_setImage(with: url)
    }
}
