//
//  UIFontExt.swift
//  QQHZ
//
//  Created by ZGTX on 2016/11/30.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import UIKit

enum FontName: String {
    case regular = ".PingFangSC-Regular"
    case light   = ".PingFangSC-Light"
    case medium  = ".PingFangSC-Medium"
}

extension UIFont {

    class func fontWithName(_ name:FontName,size: CGFloat) -> UIFont{
        return UIFont.init(name: name.rawValue, size: size)!
    }
    class func fontWithSize(_ size:CGFloat) -> UIFont {
        return UIFont.fontWithName(.regular, size: size)
    }
}
