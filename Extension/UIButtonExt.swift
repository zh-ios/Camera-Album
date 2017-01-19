//
//  UIButtonExt.swift
//  QQHZ
//
//  Created by ZGTX on 2016/12/5.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func title_nor(_ title: String) -> Self {
        self.setTitle(title, for: UIControlState.normal)
        return self
    }
    func titleColor_nor(_ titleColor: UIColor) -> Self {
        self.setTitleColor(titleColor, for: UIControlState.normal)
        return self
    }
    func titleColor_hl(_ titleColor: UIColor) -> Self {
        self.setTitleColor(titleColor, for: UIControlState.highlighted)
        return self
    }
    func titleColor_selected(_ titleColor: UIColor) -> Self {
        self.setTitleColor(titleColor, for: UIControlState.selected)
        return self
    }
    func titleColor_disabled(_ titleColor: UIColor) -> Self {
        self.setTitleColor(titleColor, for: UIControlState.disabled)
        return self
    }
    func font(_ size: CGFloat) -> Self {
        self.titleLabel?.font = UIFont.fontWithSize(size)
        return self
    }
}
