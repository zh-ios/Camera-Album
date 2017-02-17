//
//  TopView.swift
//  Camera&Album
//
//  Created by autohome on 17/1/19.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import UIKit

private let margin: CGFloat = 15
private let BtnW: CGFloat = 38

enum FlashlightMode: Int {
    case FlashlightMode_on = 1
    case FlashlightMode_off = 2
}

class TopView: UIView {
    /*!
     * 点击关闭按钮回调
     */
    var closeBtnOnClick: (() -> Void)?
    /*!
     * 点击闪光灯按钮回调
     */
    var flashLightBtnOnClick: ((_ btn: UIButton) -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupContentView() {
        let closeBtn = UIButton.init(frame: CGRect.init(x: margin, y: margin, width: BtnW, height: BtnW))
        closeBtn.setBackgroundImage(UIImage.init(named: "icon_close"), for: .normal)
        closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        let flashLightBtn = UIButton.init(frame: CGRect.init(x: self.width()-margin-BtnW, y: margin, width: BtnW, height: BtnW))
        flashLightBtn.setBackgroundImage(UIImage.init(named: "flashlight_close"), for: .normal)
        flashLightBtn.setBackgroundImage(UIImage.init(named: "flashlight_on"), for: .selected)
        flashLightBtn.addTarget(self, action: #selector(flashLight(_:)), for: .touchUpInside)
        self.addSubview(closeBtn)
        self.addSubview(flashLightBtn)
    }
    
    @objc fileprivate func flashLight(_ btn: UIButton) {
        btn.isSelected = !btn.isSelected
        if self.flashLightBtnOnClick != nil {
            self.flashLightBtnOnClick!(btn)
        }
    }
    
    @objc fileprivate func close() {
        if self.closeBtnOnClick != nil {
            self.closeBtnOnClick!()
        }
    }
}
