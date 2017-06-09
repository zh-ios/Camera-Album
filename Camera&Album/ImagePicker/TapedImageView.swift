//
//  TapedImageView.swift
//  Camera&Album
//
//  Created by autohome on 17/2/17.
//  Copyright © 2017年 autohome. All rights reserved.
//  

import Foundation
import UIKit

protocol TapedImageViewDelegate: NSObjectProtocol {
    func tapedImageView(imageView: TapedImageView, tapCount: Int)
    
}

class TapedImageView: UIImageView {
    weak var delegate: TapedImageViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = (touches as Set).first
        let tapCount = touch?.tapCount
        self.delegate?.tapedImageView(imageView: self, tapCount: tapCount!)
    }
}
