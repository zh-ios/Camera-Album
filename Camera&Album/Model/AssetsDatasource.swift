//
//  AssetsDatasource.swift
//  Camera&Album
//
//  Created by autohome on 2017/6/15.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import Photos
class AssetsDatasource: NSObject {
    
    var assetsArray: Array<AssetsModel>?

    func getAssets() -> Array<AssetsModel>? {
        let options = PHFetchOptions.init()
        options.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: true)]
        let result: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: options)
        // 初始化数据
        self.assetsArray = Array.init()
        
        result.enumerateObjects(using: { (phassets, index, stop) in
            let assets = AssetsModel.init()
            assets.isSelected = false
            self.assetsArray?.append(assets)
        })
        return self.assetsArray
    }
}
