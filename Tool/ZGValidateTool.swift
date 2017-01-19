//
//  ZGValidateTool.swift
//  QQHZ
//
//  Created by ZGTX on 2016/12/6.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation

class ValidateTool: NSObject {
    class func isValidatePhone(_ phone: String?) -> Bool {
        let regex = "^1(3|5|7|8|4)\\d{9}"
        let expression = try? NSRegularExpression.init(pattern: regex, options: .caseInsensitive)
        
        let result = expression?.matches(in: phone!, options: [], range: NSRange.init(location: 0, length: (phone! as NSString).length))
        return (result?.count)! > 0
    }
}
