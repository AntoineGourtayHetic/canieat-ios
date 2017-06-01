//
//  RestaurantFullCell.swift
//  userLocation
//
//  Created by Yohan Atlan on 01/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class RestaurantFullCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
