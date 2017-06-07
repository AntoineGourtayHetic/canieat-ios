//
//  DetailRecetteController.swift
//  userLocation
//
//  Created by Yohan Atlan on 07/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class DetailRecetteController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personne: UILabel!
    @IBOutlet weak var difficulte: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var contenu: UILabel!
    
    var selectedRecette = Recette()
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = selectedRecette.name
        personne.text = selectedRecette.personne
        difficulte.text = selectedRecette.difficulte
        ingredients.text = selectedRecette.ingredients
        contenu.text = selectedRecette.contenu

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
