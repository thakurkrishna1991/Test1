//
//  EventList.swift
//  bitscan
//
//  Created by Krishna Thakur on 11/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit
import KDCircularProgress

class EventList: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! EventListCell
        // Initialization code
        
        var label = UILabel(frame: CGRectMake(0, 0, 21, 21))
        label.center = CGPointMake(160, 284)
        label.textAlignment = NSTextAlignment.Center
        label.text = "75%"
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        
        
        let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 87, height: 87))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.19
        progress.clockwise = true
        //progress.center = cell.bigCircle.center
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .NoGlow
        progress.angle = 300
        progress.setColors(UIColor(hue: 142/360, saturation: 100/100, brightness: 97/100, alpha: 1.0))
        cell.bigCircle.addSubview(progress)
        
        
        let progress1 = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        progress1.startAngle = -90
        progress1.progressThickness = 0.2
        progress1.trackThickness = 0.19
        progress1.clockwise = true
        //progress.center = cell.bigCircle.center
        progress1.gradientRotateSpeed = 2
        progress1.roundedCorners = true
        progress1.glowMode = .NoGlow
        progress1.angle = 355
        progress1.setColors(UIColor(hue: 142/360, saturation: 100/100, brightness: 97/100, alpha: 1.0))
        cell.circle1.addSubview(progress1)
        
        let progress2 = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        progress2.startAngle = -90
        progress2.progressThickness = 0.2
        progress2.trackThickness = 0.19
        progress2.clockwise = true
        //progress.center = cell.bigCircle.center
        progress2.gradientRotateSpeed = 2
        progress2.roundedCorners = true
        progress2.glowMode = .NoGlow
        progress2.angle = 300
        progress2.setColors(UIColor(hue: 142/360, saturation: 100/100, brightness: 97/100, alpha: 1.0))
        cell.circle2.addSubview(progress2)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! EventListCell
        self.performSegueWithIdentifier("next", sender: self)
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
