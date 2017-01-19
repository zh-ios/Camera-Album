//
//  ZGHUDTool.swift
//  QQHZ
//
//  Created by ZGTX on 2016/11/29.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import MBProgressHUD
import UIKit
typealias completed = () -> Void
private let duration = 1.0
private let HUDToolSharedInstance = HUDTool()
class HUDTool: NSObject,MBProgressHUDDelegate {
    class var sharedInstance: HUDTool {
        return HUDToolSharedInstance
    }
    
    func showToast(title: String!,completed: completed?) {
        let window = UIApplication.shared.keyWindow! as UIView
        let hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud.animationType = .fade
        hud.mode = .text
        hud.label.text = title
        hud.label.textColor = UIColor.white
        hud.bezelView.style = .solidColor // 去掉蒙层
        hud.bezelView.color = UIColor.colorWithHexString("333333").withAlphaComponent(0.8)
        hud.hide(animated: true, afterDelay: duration)
        hud.removeFromSuperViewOnHide = true
    }
    
    func showHUDInView(_ view: UIView?,title: String?,completed: completed) {
        
        var hud = MBProgressHUD.init()
        if view != nil {
            hud = MBProgressHUD.showAdded(to: view!, animated: true)
        } else {
            let window = UIApplication.shared.keyWindow! as UIView
            hud = MBProgressHUD.showAdded(to: window, animated: true)
        }
        hud.animationType = .fade
        if title != nil { hud.label.text = title }        
        hud.hide(animated: true, afterDelay: duration)
        hud.bezelView.style = .solidColor
        hud.bezelView.color = SystemColor.black_lv3.withAlphaComponent(0.8)
        hud.isSquare = true
        hud.removeFromSuperViewOnHide = true
        hud.contentColor = UIColor.white
        hud.label.font = UIFont.fontWithSize(14)
        hud.offset = CGPoint.init(x: 0, y: 60) // hud's place
    }
}
