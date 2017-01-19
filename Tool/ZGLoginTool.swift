//
//  ZGLoginTool.swift
//  QQHZ
//
//  Created by ZGTX on 2016/12/6.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
private let loginKey = "loginKey"
class LoginTool: NSObject {
    
    class func isLogin() -> Bool {
       return UserDefaults.standard.bool(forKey: loginKey)
    }
    
    class func login() {
        UserDefaults.standard.set(true, forKey: loginKey)
        UserDefaults.standard.synchronize()
    }
    class func logout() {
        UserDefaults.standard.set(false, forKey: loginKey)
        UserDefaults.standard.synchronize()
    }
}
