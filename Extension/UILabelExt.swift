//
//  UILabelExt.swift
//  YouthHelp
//
//  Created by ZGTX on 2016/11/16.
//  Copyright © 2016年 ZGTX. All rights reserved.
//  

import Foundation
import UIKit

extension UILabel {
    func heightWith(font:CGFloat,width:CGFloat) -> CGFloat? {
        let text = self.text
        let height = text?.strHeight(font: font, width: width)
        return height
    }
    
    func widthWith(font:CGFloat,height:CGFloat) -> CGFloat? {
        let text = self.text
        let width = text?.strWidth(font: font, height: height)
        return width
    }
    
    func font(name: FontName,size: CGFloat) -> Self {
        self.font = UIFont.fontWithName(name, size: size)
        return self
    }
    // default .regular
    func font(size: CGFloat) -> Self {
        self.font = UIFont.fontWithName(.regular, size: size)
        return self
    }
    
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
}
