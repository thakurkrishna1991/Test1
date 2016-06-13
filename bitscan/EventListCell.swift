//
//  EventListCell.swift
//  bitscan
//
//  Created by Krishna Thakur on 11/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit
import KDCircularProgress

class EventListCell: UITableViewCell {

    @IBOutlet weak var count2: UILabel!
    @IBOutlet weak var amnt2: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var count1: UILabel!
    @IBOutlet weak var amnt1: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var bigCount: UILabel!
    @IBOutlet weak var bigCal: UILabel!
    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var bigCircle: UIView!
    @IBOutlet weak var circle1: UIView!
    @IBOutlet weak var circle2: UIView!
    @IBOutlet weak var bigCheck: UIButton!
    @IBOutlet weak var chk1: UIButton!
    @IBOutlet weak var chk2: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
