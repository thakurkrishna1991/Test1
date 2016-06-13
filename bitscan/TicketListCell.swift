//
//  TicketListCell.swift
//  bitscan
//
//  Created by Krishna Thakur on 10/06/16.
//  Copyright © 2016 directweb. All rights reserved.
//

import UIKit

class TicketListCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ticketDetail: UILabel!
    @IBOutlet weak var ticketCode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
