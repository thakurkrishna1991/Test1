//
//  FirstViewController.swift
//  bitscan
//
//  Created by Krishna Thakur on 07/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet var camera: UIView!
    
    // Barcode scanner data's
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var windowFrame:UIView?
    var captureDevice:AVCaptureDevice?

    internal var barcodeScanned:((String) -> ())?
    
    private var allowedTypes = [AVMetadataObjectTypeUPCECode,
                                AVMetadataObjectTypeCode39Code,
                                AVMetadataObjectTypeCode39Mod43Code,
                                AVMetadataObjectTypeEAN13Code,
                                AVMetadataObjectTypeEAN8Code,
                                AVMetadataObjectTypeCode93Code,
                                AVMetadataObjectTypeCode128Code,
                                AVMetadataObjectTypePDF417Code,
                                AVMetadataObjectTypeQRCode,
                                AVMetadataObjectTypeAztecCode,
                                AVMetadataObjectTypeDataMatrixCode,
                                AVMetadataObjectTypeITF14Code,
                                AVMetadataObjectTypeInterleaved2of5Code
    ]
    
    //var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var lastCapturedCode:String?
    var barcode:String!
    var timer : NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve the default capturing device for using the camera
        self.captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        // Get an instance of the AVCaptureDeviceInput class using the previous device object.
        var error:NSError?
        let input: AnyObject!
        do {
            input = try AVCaptureDeviceInput(device:captureDevice)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error != nil) {
            // If any error occurs, simply log the description of it and don't continue any more.
            print("\(error?.localizedDescription)")
            return
        }
        
        // Initialize the captureSession object and set the input device on the capture session.
        captureSession = AVCaptureSession()
        captureSession?.addInput(input as! AVCaptureInput)
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        
        // Set delegate and use the default dispatch queue to execute the call back
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        captureMetadataOutput.metadataObjectTypes = self.allowedTypes
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResize
        videoPreviewLayer?.frame = camera.layer.bounds
        camera.layer.addSublayer(videoPreviewLayer!)
        
        
        // Initialize QR Code Frame to highlight the QR code
        
        //windowFrame?.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin, UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin]
        
        // Start video capture.
        captureSession?.startRunning()
        
        
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView?.layer.borderWidth = 2
        qrCodeFrameView?.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin, UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin]
        
        camera.addSubview(qrCodeFrameView!)
        camera.bringSubviewToFront(qrCodeFrameView!)
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    internal override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        videoPreviewLayer?.frame = self.camera.layer.bounds
        
        let orientation = UIApplication.sharedApplication().statusBarOrientation
        
        switch(orientation) {
        case UIInterfaceOrientation.LandscapeLeft:
            videoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeLeft
            
        case UIInterfaceOrientation.LandscapeRight:
            videoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeRight
            
        case UIInterfaceOrientation.Portrait:
            videoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
            
        case UIInterfaceOrientation.PortraitUpsideDown:
            videoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.PortraitUpsideDown
            
        default:
            print("Unknown orientation state")
        }
    }
    
    
    internal override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        videoPreviewLayer?.frame = camera.layer.bounds
    }
    
    internal func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRectZero
            print("No QR code is detected")
            return
        }
        
        // Get the metadata object.
        for data in metadataObjects {
            let metadataObj = data as! AVMetadataMachineReadableCodeObject
            if self.allowedTypes.contains(metadataObj.type) {
                // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
                let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
                
                qrCodeFrameView?.frame = barCodeObject.bounds;
                
                if metadataObj.stringValue != nil {
                    self.lastCapturedCode = metadataObj.stringValue
                    self.barcode = metadataObj.stringValue
                    self.startTimer()
                    self.captureSession!.stopRunning()
                    break
                }
                
            }
            
            
        }
        
        
        
        
    }
    
    func startTimer() {
        if timer?.valid != true {
            timer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: #selector(FirstViewController.removeBorder), userInfo: nil, repeats: false)
        }
    }
    
    func removeBorder() {
        /* Remove the identified border */
        self.qrCodeFrameView?.hidden = true
        self.captureSession?.startRunning()
        
    }

    
    internal override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.navigationController?.popViewControllerAnimated(true)
        
        if let barcodeScannedTemp = barcodeScanned, lastCapturedCodeTemp = lastCapturedCode  {
            // Notify via callback
            barcodeScannedTemp(lastCapturedCodeTemp)
        }
    }
    
    
    
    
    override func viewDidDisappear(animated: Bool) {
        captureSession!.stopRunning()
        
    }
    override func viewWillAppear(animated: Bool) {
              captureSession!.startRunning()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        captureSession!.stopRunning()
        //self.util.pingServer(self.sessionID)
    }
    
  

}

