//
//  ViewController.swift
//  Camera&Album
//
//  Created by autohome on 17/1/19.
//  Copyright © 2017年 autohome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let takePhotoVC = TakePhotoViewController.init()
        self.present(takePhotoVC, animated: true, completion: nil)
    }

}

