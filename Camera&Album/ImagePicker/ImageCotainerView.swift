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
        
        let pinch = UIPinchGestureRecognizer.init(target: self, action: #selector(pinch(_ :)))
        self.addGestureRecognizer(pinch)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pinch(_ pinch: UIPinchGestureRecognizer) {
        let crtScale = pinch.scale
        self.setZoomScale(crtScale, animated: true)
    }
    
    /*!
     * tapedImageViewDelegate
     */
    func tapedImageView(imageView: TapedImageView, tapCount: Int) {
        if tapCount == 1 {
            
        } else if tapCount == 2 {
            self.setZoomScale(2.0, animated: true)
        } else {
            
        }
    }
}
