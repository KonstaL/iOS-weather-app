//
//  TableViewCellViewController.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 24/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImageVIew: UIImageView!
    
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
