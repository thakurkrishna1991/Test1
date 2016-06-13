//
//  SecondViewController.swift
//  bitscan
//
//  Created by Krishna Thakur on 07/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var barcode: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for parent in self.navigationController!.navigationBar.subviews {
            for childView in parent.subviews {
                if(childView is UIImageView) {
                    childView.removeFromSuperview()
                }
            }
        }
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        barcode.layer.cornerRadius = 2
        barcode.layer.shadowColor = UIColor(red: 0/255, green: 101/255, blue: 255/255, alpha: 1.0).CGColor
        barcode.layer.shadowOffset = CGSizeMake(0, 0.5);
        barcode.layer.shadowOpacity = 0.5;
        barcode.layer.shadowRadius = 0.5;
        
        self.searchbar.endEditing(true)
        searchbar.showsScopeBar = true
        searchbar.delegate = self
        let textFieldInsideSearchBar = searchbar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar!.attributedPlaceholder = NSAttributedString(string:"Search Name, email, Barcode",attributes:[NSForegroundColorAttributeName: UIColor(hue: 209/360, saturation: 3/100, brightness: 81/100, alpha: 0.70)])
        textFieldInsideSearchBar?.textColor = UIColor.whiteColor()
        textFieldInsideSearchBar!.tintColor = UIColor.whiteColor()
        textFieldInsideSearchBar!.backgroundColor = UIColor(hue: 209/360, saturation: 76/100, brightness: 91/100, alpha: 0.65)
        
        var image: UIImage = UIImage(named: "search")!
        self.searchbar.setImage(image, forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Normal)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    }
    
    func searchBarSearchButtonClicked( searchBar: UISearchBar)
    {
        
        dispatch_async(dispatch_get_main_queue(), {
            if self.searchbar.text != ""{
                let searchStr = self.searchbar.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
             self.searchbar.resignFirstResponder()
            }
        
        })
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return 2
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TicketListCell
        cell.ticketCode.text = "C73BSC"
        cell.ticketDetail.text = "Deluxe + 10 Tokens"
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TicketListCell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let button1 = UITableViewRowAction(style: .Default, title: "Check-Out", handler: { (action, indexPath) in
            print("button1 pressed!")
        })
        button1.backgroundColor = UIColor(red: 0/255, green: 101/255, blue: 255/255, alpha: 1.0)
        return [button1]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    @IBAction func setting(sender: AnyObject) {
    }
    @IBAction func filter(sender: AnyObject) {
    }
    
    func imageWithView(view:UIView)->UIImage{
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }


}

