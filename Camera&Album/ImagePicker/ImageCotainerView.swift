//
//  ImageCotainerView.swift
//  Camera&Album
//
//  Created by autohome on 17/2/17.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import UIKit

class ImageContainerView: UIScrollView, TapedImageViewDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapedImageView = TapedImageView.init(frame: frame)
        tapedImageView.delegate = self
        self.addSubview(tapedImageView)
        self.zoomScale = 2.0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*!
     * tapedImageViewDelegate
     */
    func tapedImageView(imageView: TapedImageView, tapCount: Int) {
        
    }
    
    
}
