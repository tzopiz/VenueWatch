//
//  UIImage.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/31/24.
//

import UIKit

extension UIImage {
    /// Создает новое изображение, масштабированное до указанной ширины, сохраняя пропорции.
    /// - Parameter width: Новая ширина изображения после масштабирования.
    /// - Returns: Новое изображение, масштабированное до указанной ширины, или nil, если не удалось создать новое изображение.
    func scaled(to width: CGFloat) -> UIImage? {
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
