//
//  BottomView.swift
//  Camera&Album
//
//  Created by autohome on 17/1/19.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import UIKit
class BottomView: UIView {
    var takePhotoBtnOnClick: ((_ btn: UIButton) -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupContentView() {
        let takePhotoBtn = UIButton.init(frame: CGRect.init(x: self.width()*0.5-30, y: self.height()-30-60, width: 60, height: 60)).cornerRadius(radius: 30)
        takePhotoBtn.backgroundColor = UIColor.colorWithHexString("2873ff")
        takePhotoBtn.layer.borderWidth = 2
        takePhotoBtn.layer.borderColor = UIColor.white.cgColor
        takePhotoBtn.addTarget(self, action: #selector(takePhoto(_:)), for: .touchUpInside)
        self.addSubview(takePhotoBtn)
    }
    @objc fileprivate func takePhoto(_ btn: UIButton) {
        // 点击了拍照按钮
        if self.takePhotoBtnOnClick != nil {
            self.takePhotoBtnOnClick!(btn)
        }
    }
}
