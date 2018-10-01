//// For App Store
//  VersesTableViewCell.swift
//  Poetry
//
//  Created by MacBook on 03.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class VersesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var сhapterLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
