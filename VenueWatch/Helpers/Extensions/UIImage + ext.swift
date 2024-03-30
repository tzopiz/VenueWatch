//
//  UIImage + ext.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/31/24.
//

import UIKit

extension UIImage {
    func scaledToWidth(_ width: CGFloat) -> UIImage? {
        let scale = width / size.width
        let newHeight = size.height * scale
        let newSize = CGSize(width: width, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return newImage
    }
}
