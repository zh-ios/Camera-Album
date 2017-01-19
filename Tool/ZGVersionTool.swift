//
//  ZGVersionTool.swift
//  QQHZ
//
//  Created by ZGTX on 2016/11/28.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import UIKit

class VersionTool: NSObject {
    class func crtVersion() -> String! {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    class func buildVersion() -> String! {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    class func crtIOSVersion() -> String! {
        return "\(UIDevice.current.systemVersion)"
    }
    class func oldVersion() ->String? {
        return UserDefaults.standard.object(forKey: "oldVersion") as? String
    }
    class func saveCrtVersion() {
        UserDefaults.standard.set(crtVersion(), forKey: "currentVersion")
    }
    class func isNeedUpdate() -> Bool{
        if oldVersion() == nil {
            return false
        }
        return oldVersion() == crtVersion() ? false : true
    }
}
