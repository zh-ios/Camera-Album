//
//  ZGHUDToastView.swift
//  QQHZ
//
//  Created by ZGTX on 2016/11/29.
//  Copyright © 2016年 ZGTX. All rights reserved.
//

import Foundation
import UIKit

private let topPadding = CGFloat(10)
private let leftPadding = CGFloat(15)
private let maxW = (kScreenW - 60*2)
class ToastView: UIView {
    var titleLabel: UILabel!
    
    init(frame: CGRect,title: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.colorWithHexString("111111")
        self.alpha = 0.7
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.titleLabel = UILabel.init(frame: CGRect.zero)
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.fontWithName(.regular, size: 17)
        self.titleLabel.textAlignment = .center
        self.titleLabel.numberOfLines = 1
        self.titleLabel.text = title
        self.addSubview(self.titleLabel)
        updateFrame()

    }  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func updateFrame() {
        // 一行..
        self.frame = CGRect.init(x: 0, y: 0, width: 120, height: 120)
        self.titleLabel.frame = CGRect.init(x: 9, y: 0, width: self.width(), height: self.height())
    }
}
