//
//  MenuController.swift
//  userLocation
//
//  Created by Yohan Atlan on 06/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    @IBOutlet weak var buttonCarte: UIButton!
    @IBOutlet weak var buttonRecettes: UIButton!
    @IBOutlet weak var buttonApropos: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCarte.layer.cornerRadius = 10
        buttonRecettes.layer.cornerRadius = 10
        buttonApropos.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
