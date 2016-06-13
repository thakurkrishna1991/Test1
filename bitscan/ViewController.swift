//
//  ViewController.swift
//  bitscan
//
//  Created by Krishna Thakur on 08/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the default color of the icon of the selected UITabBarItem and Title
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
        // Sets the default color of the background of the UITabBar
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        
        // Sets the background color of the selected UITabBarItem (using and plain colored UIImage with the width = 1/5 of the tabBar (if you have 5 items) and the height of the tabBar)
        UITabBar.appearance().selectionIndicatorImage = UIImage().makeImageWithColorAndSize(UIColor.blueColor(), size: CGSizeMake(tabBar.frame.width/5, tabBar.frame.height))
        
        // Uses the original colors for your images, so they aren't not rendered as grey automatically.
       tabBar.selectionIndicatorImage = UIImage(named: "uncam")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tabBarController?.tabBar.tintColor = UIColor.whiteColor()
        tabBarController?.tabBar.selectionIndicatorImage = nil
        super.viewWillAppear(animated)
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
extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
