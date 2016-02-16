//
//  DemographicCell.swift
//  CodeTest
//
//  Created by Work on 17/02/2016.
//  Copyright © 2016 Work. All rights reserved.
//

import UIKit

class DemographicCell: UITableViewCell {

    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
