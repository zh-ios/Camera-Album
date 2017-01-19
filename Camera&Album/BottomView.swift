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
    override init(frame: CGRect) {
        setupContentView()
    }
    
    private func setupContentView() {
        let takePhotoBtn = UIButton.init(frame: CGRect.init(x: self.width()*0.5-30, y: self.height()-30-60, width: 60, height: 60))
        
    }
}
