//
//  DetailViewController.swift
//  userLocation
//
//  Created by Yohan Atlan on 01/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    var selectedRestaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = selectedRestaurant.name
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
