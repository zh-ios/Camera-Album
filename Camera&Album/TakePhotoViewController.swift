//
//  TakePhotoViewController.swift
//  Camera&Album
//
//  Created by autohome on 17/1/19.
//  Copyright © 2017年 autohome. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AssetsLibrary
class TakePhotoViewController: UIViewController,UIAlertViewDelegate {
    // 预览层view
    var preview: UIView!
    // 相机设备
    var device: AVCaptureDevice!
    // 输入设备 摄像头 麦克风等.
    var input: AVCaptureDeviceInput!
    // 输出图像
    var imageOutput: AVCaptureStillImageOutput!
    // 输入设备和输出设备之间的数据交换
    var session: AVCaptureSession!
    // 预览图像layer
    var previewLayer: AVCaptureVideoPreviewLayer!
    // session通过connection连接 stillImageOutput 输出图像
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 监听对焦
        self.input.addObserver(self, forKeyPath: "adjustingFocus", options: .new, context: nil)
        self.session.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.input.removeObserver(self, forKeyPath: "adjustingFocus")
    }
    
    var connection: AVCaptureConnection!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithHexString("111111")
        checkAuth()
        initUI()
        initDeviceConfig()
        
    }
    
    fileprivate func initUI() {
        
        self.preview = UIView.init(frame: self.view.frame).backgroundColor(color: UIColor.colorWithHexString("111111"))
        // 添加点击手势
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapPreview(_:)))
        self.preview.addGestureRecognizer(tap)
        let pinch = UIPinchGestureRecognizer.init(target: self, action: #selector(pinchPreview(_:)))
        self.preview.addGestureRecognizer(pinch)
        self.view.addSubview(self.preview)
        
        weak var weakSelf = self
        let topView = TopView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.width(), height: 70))
        topView.closeBtnOnClick = {
            weakSelf?.dismiss(animated: true, completion: nil)
        }
        
        topView.flashLightBtnOnClick = {
            btn in
            weakSelf!.configFlashlight(btn)
        }
        self.view.addSubview(topView)
        
        
        let bottomView = BottomView.init(frame: CGRect.init(x: 0, y: kScreenH - 120, width: self.view.width(), height: 120))
        self.view.addSubview(bottomView)

          bottomView.takePhotoBtnOnClick = {
            (_ btn: UIButton) in
            printLog("----点击了照相")
            weakSelf!.getPhoto()
        }
    }
    
    fileprivate func getPhoto() {
        self.connection.videoScaleAndCropFactor = 2
        self.connection.videoOrientation = .portrait
        self.imageOutput.captureStillImageAsynchronously(from: self.connection, completionHandler: {
            (buffer,error) in
            let imgData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer)
            let status = ALAssetsLibrary.authorizationStatus()
            switch status {
            case .authorized:
                UIImageWriteToSavedPhotosAlbum(UIImage.init(data: imgData!)!, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
                break
            case .denied:
                break
            case .restricted:
                break
            case .notDetermined:
                AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: {
                    granted in
                    if granted {
                        UIImageWriteToSavedPhotosAlbum(UIImage.init(data: imgData!)!, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
                    } else {
                        printLog("没有访问权限")
                    }
                })
                break
            }
        })
    }
    
    
    //  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
    @objc fileprivate func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if error == nil {
            printLog("保存成功")
        } else {
            printLog("保存失败")
        }
        
    }

    
    fileprivate func initDeviceConfig() {
        self.device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        /*!
         * 初始化闪光灯状态
         */
        do {
            try self.device.lockForConfiguration()
        } catch  {
            return
        }
        self.device.flashMode = .off
        self.device.unlockForConfiguration()
        
        self.session = AVCaptureSession.init()
        if self.session.canSetSessionPreset(AVCaptureSessionPresetPhoto) {
            self.session.sessionPreset = AVCaptureSessionPresetPhoto
        }
        // 初始化输入设备
        self.input = try? AVCaptureDeviceInput.init(device: self.device)
        if self.input == nil {
            return
        }
        // 初始化图片输出
        self.imageOutput = AVCaptureStillImageOutput.init()
        self.imageOutput.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
        // 判断
        if self.session.canAddInput(self.input) {
            self.session.addInput(self.input)
        }
        if self.session.canAddOutput(self.imageOutput) {
            self.session.addOutput(self.imageOutput)
        }
        //
        self.connection = self.imageOutput.connection(withMediaType: AVMediaTypeVideo)

        // 初始化预览图层
        self.previewLayer = AVCaptureVideoPreviewLayer.init(session: self.session)
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.previewLayer.frame = self.preview.frame
        self.preview.layer.addSublayer(self.previewLayer)
    }
    
    @objc fileprivate func tapPreview(_ tap: UITapGestureRecognizer) {
        
    }
    
    @objc fileprivate func pinchPreview(_ pinch: UIPinchGestureRecognizer) {
        
    }
    
    // 检测相机授权状态
    fileprivate func checkAuth() {
        let status = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        switch status {
        case .authorized:
            break
        case .denied:
            showAlert()
            break
        case .restricted:
            showAlert()
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: {
                granted in
                if granted {
                    
                } else {
                    self.showAlert()
                }
            })
            break
        }
    }
    
    fileprivate func showAlert() {
        // 到主线程中显示alert
        DispatchQueue.main.async {
            let alert = UIAlertView.init(title: nil, message: "请在“设置-隐私”选项中，允许访问您的相机", delegate: self, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    // 切换闪光灯
    fileprivate func configFlashlight(_ btn: UIButton) {
        do {
            try self.device.lockForConfiguration()
        } catch  {
            return
        }
        if btn.isSelected == true {
            self.device.flashMode = .on
        } else {
            self.device.flashMode = .off
        }
        self.device.unlockForConfiguration()
    }
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
