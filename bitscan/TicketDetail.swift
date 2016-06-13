//
//  TicketDetail.swift
//  bitscan
//
//  Created by Krishna Thakur on 11/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit

class TicketDetail: UIViewController {

    @IBOutlet weak var amountView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //amountView.layer.borderWidth = 1
        amountView.layer.masksToBounds = false
        amountView.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0).CGColor
        amountView.layer.cornerRadius = amountView.frame.height/2
        amountView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
