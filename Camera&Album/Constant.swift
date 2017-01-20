//
//  Constant.swift
//  YouthHelp
//
//  Created by ZGTX on 2016/11/21.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import UIKit

let kScreenH = UIScreen.main.bounds.size.height as CGFloat
let kScreenW = UIScreen.main.bounds.size.width as CGFloat
let kLineH   = 0.5 as CGFloat
let kNavBarH = 64.0 as CGFloat
let kStatusBarH = 20.0 as CGFloat
let kTabarH  = 49.0 as CGFloat
let kDocPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first

func kHeight(_ height: CGFloat) -> CGFloat {
    return height * kScreenH / 667
}
func kWidth(_ width: CGFloat) -> CGFloat {
    return width * kScreenW / 375
}
struct SystemColor {
    static let orange = UIColor.colorWithHexString("ff7a00")
    static let blue   = UIColor.colorWithHexString("398dee")
    static let lineBackgroundColor = UIColor.colorWithHexString("d8d8d8")
    static let backgroundColor = UIColor.colorWithHexString("f5f5f5")
    static let black_lv0 = UIColor.colorWithHexString("030303")
    static let black_lv2 = UIColor.colorWithHexString("2a2a2a")
    static let black_lv3 = UIColor.colorWithHexString("333333")
    static let black_lv6 = UIColor.colorWithHexString("666666")
    static let black_lv9 = UIColor.colorWithHexString("999999")
}

func printLog<T>(_ message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

