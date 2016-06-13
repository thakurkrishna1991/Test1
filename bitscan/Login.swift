//
//  Login.swift
//  bitscan
//
//  Created by Krishna Thakur on 07/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var ipView: UIView!
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var loginWithQR: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var checkBoz: UIButton!
    @IBOutlet weak var ipAddress: UITextField!
    @IBOutlet weak var entranceKey: UITextField!
    @IBOutlet weak var mixer: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginWithQR.backgroundColor = UIColor.clearColor()
        loginWithQR.layer.cornerRadius = 2
        loginWithQR.layer.borderWidth = 2
        loginWithQR.layer.borderColor = UIColor(red: 0/255, green: 101/255, blue: 255/255, alpha: 1.0).CGColor
        
        login.layer.cornerRadius = 2
        login.layer.shadowColor = UIColor.grayColor().CGColor
        login.layer.shadowOffset = CGSizeMake(0, 0.5);
        login.layer.shadowOpacity = 0.5;
        login.layer.shadowRadius = 0.5;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func mixerAction(sender: AnyObject) {
    }
    
    @IBAction func LoginAction(sender: AnyObject) {
    }
    @IBAction func loginWithQRAction(sender: AnyObject) {
    }
    @IBAction func bitscannetAction(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
