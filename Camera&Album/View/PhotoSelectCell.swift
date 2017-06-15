//
//  PhotoSelectCell.swift
//  Camera&Album
//
//  Created by autohome on 2017/6/15.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import UIKit

// 按钮点击的delegate
protocol PhotoSelectCellDelegate: NSObjectProtocol {
    func selectBtnOnClick(_ btn: UIButton) -> Void
}

class PhotoSelectCell: UICollectionViewCell {

    // 按钮点击回调
    var btnOnClickBlock: ((_ btn: UIButton) -> Void)?
    
    var imageView: UIImageView!
    var selectBtn: UIButton!
    
    weak var delegate: PhotoSelectCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupContentView() {
        self.imageView = UIImageView.init(frame: self.bounds)
        self.imageView.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(self.imageView)
        
        self.selectBtn = UIButton.init(frame: CGRect.init(x: self.width()-40, y: 0, width: 40, height: 40))
        self.selectBtn.addTarget(self, action: #selector(selectImg(_:)), for:.touchUpInside)
        self.selectBtn.setImage(UIImage.init(named: "selected"), for: .selected)
        self.selectBtn.setImage(UIImage.init(named: "unselected"), for: .normal)
        self.imageView.addSubview(self.selectBtn)
    }
    
    @objc fileprivate func selectImg(_ btn: UIButton) {
        printLog("选中了照片")
        btn.isSelected = !btn.isSelected;
        if self.btnOnClickBlock != nil {
            self.btnOnClickBlock!(btn)
        }
        
        if self.delegate != nil {
            self.delegate!.selectBtnOnClick(btn)
        }
    }
}
