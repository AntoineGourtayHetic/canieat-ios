//
//  RestaurantDuoCell.swift
//  userLocation
//
//  Created by Yohan Atlan on 01/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class RestaurantDuoCell: UITableViewCell {

    @IBOutlet weak var restaurantImageLeft: UIImageView!
    @IBOutlet weak var restaurantNameLeft: UILabel!
    @IBOutlet weak var restaurantImageRight: UIImageView!
    @IBOutlet weak var restaurantNameRight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
