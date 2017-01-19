//
//  StringExt.swift
//  YouthHelp
//
//  Created by ZGTX on 2016/11/16.
//  Copyright © 2016年 ZGTX. All rights reserved.
//  常用字符串操作扩展

import Foundation
import UIKit


extension String {
    // 字符串高度
    func strHeight(font:CGFloat,width:CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: font)
        let size = CGSize.init(width: width, height: 10000)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attr = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil)
        return rect.height
    }
    
    func strWidth(font:CGFloat,height:CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: font)
        let size = CGSize.init(width: 10000, height: height)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attr = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attr, context: nil)
        return rect.width
    }
    
    // 去掉字符串两端的空格和换行
    func trimmingStr() -> String {
        let tempStr = self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return tempStr
    }
    
    func md5String(str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    func subStringToIndex(_ to: Int) -> String {
        return self.substring(to: index(self.startIndex, offsetBy: to))
    }

    func subStringFromIndex(_ from: Int) -> String {
        let tempStr = self as NSString
        return self.subStringInRange(Range(from..<tempStr.length))
    }

    // range(int a ..<int b) 从a的位置开始截取到b的位置！ 
    func subStringInRange(_ range: Range<Int>) -> String{
        
        guard range.upperBound <= range.lowerBound else {
            print("值范围错误")
            return ""
        }
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound)
        return self.substring(with: Range(startIndex..<endIndex))
    }
}
