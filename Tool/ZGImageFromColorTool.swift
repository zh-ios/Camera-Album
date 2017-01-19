//
//  ImageFromColorTool.swift
//  QQHZ
//
//  Created by ZGTX on 2016/11/28.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import UIKit
class ImageFromeColorTool: NSObject {
    class func imageWithColor(_ color: UIColor,size: CGSize,cornerRadius: CGFloat) -> UIImage!{
        
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // Begin a new image that will be the new image with the rounded corners
        // (here with the size of an UIImageView)
        UIGraphicsBeginImageContext(size);
        
        // Add a clip before drawing anything, in the shape of an rounded rect
        UIBezierPath.init(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        // Draw  image
        image?.draw(in: rect)
        
        // Get the image, here setting the UIImageView image
        let crtImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // Lets forget about that we were drawing
        UIGraphicsEndImageContext();
        
        return crtImage;
    }
    
    class func imageWithColor(_ color: UIColor) -> UIImage! {
        return imageWithColor(color, size: CGSize.init(width: 1.0, height: 1.0), cornerRadius: 0)
    }
}
