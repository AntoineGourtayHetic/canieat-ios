//
//  RecettesFullCell.swift
//  userLocation
//
//  Created by Yohan Atlan on 07/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class RecettesFullCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personnes: UILabel!
    @IBOutlet weak var difficulte: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
