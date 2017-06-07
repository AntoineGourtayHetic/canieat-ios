//
//  RecettesViewController.swift
//  userLocation
//
//  Created by Yohan Atlan on 07/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class RecettesViewController: UIViewController {
    
    var recettes: [Recette] = [Recette]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self as! UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        
        var recette1 = Recette()
        recette1.name = "Tarte aux poivrons"
        recette1.ingredients = "1 pâte brisée végétale (facile à trouver en supermarché), 200 ml de crème soja, 1 càs de moutarde, 2 gros poivron, 1 càc de bouillon de légumes en poudre, Poivre"
        recette1.contenu = "Nettoyer et couper les poivrons en lamelles. Faire fondre les lamelles de poivrons dans une poêle avec un peu d’huile d’olive. Dans un grand bol, mélanger la crème, la moutarde, le bouillon de légume et le poivre. Dérouler la pâte et l’étaler sur le moule à tarte, y mettre les poivrons, puis verser la préparation sur l’ensemble. Enfourner à four moyen (180° C/thermostat 6) une bonne demi-heure en surveillant la cuisson. Déguster avec une bonne salade verte ou une salade de tomates."
        recette1.personne = "Personnes : 8"
        recette1.difficulte = "Difficulté : facile"
        
        var recette2 = Recette()
        recette2.name = "Steak de betteraves et quinoa"
        recette2.ingredients = "100 g betteraves crues hachées grossièrement, 4 càs (100 g)  de quinoa rouge cuit (ou quinoa blanc), 2 càs d’arrow root 20g avec 80 ml d’eau, 1 càs de sauce soja, 1/2 oignon émincé (50 g), 1 gousse d’ail hachée, 3 à 4 càs de chapelure (40 g), 2 càs d’huile"
        recette2.contenu = "Éplucher la betterave et la hacher (par exemple avec un mixeur). Émincer l’oignon et le faire revenir dans 1 càs d’huile. Dans un saladier, mettre l’arrow root avec l’eau, le quinoa, 1 gousse d’ail, la chapelure et 1 càs de sauce soja, poivrer et mélanger le tout. Rajouter la betterave et l’oignon et mélanger à nouveau. Avec la pâte, former 2 steaks. Les cuire dans la poêle huilée pendant 5 min de chaque côté."
        recette2.personne = "Personnes : 2"
        recette2.difficulte = "Difficulté : facile"
        
        var recette3 = Recette()
        recette3.name = "Brioche moelleuse pur beurre végétal"
        recette3.personne = "Personnes : 12"
        recette3.difficulte = "Difficulté : difficile"
        recette3.ingredients = "500 g de farine T45 gruau, 10 cl de lait végétal tiède (soja par exemple), 21 g de levure fraiche (achat en boulangerie), 150 g de jus de pois chiche ou jus d’haricots rouges (jus d’une petite boite de conserve), 150 g de tofu soyeux, 100 g sucre de canne, 12 g de sel, 220 g de margarine végétal non salé (du type St Hubert bio), Quelques gouttes d’amande amère (ou de vanille), Du sirop d’érable ou d’agave"
        recette3.contenu = "Pour que la brioche se conserve plus longtemps et qu’elle soit plus savoureuse, on peut réaliser un levain sur levure (ou préferment) :, Dans un saladier ou la cuve d’un robot, verser 100 g de farine, le lait végétal tiède, les 21 g de levure. Mélanger grossièrement avec une baguette chinoise ou le manche d’une cuillère en bois. Verser le reste de la farine sur le dessus, sans mélanger. Laisser le préferment lever jusqu’à ce qu’il perse le dessus de la farine (environ 10 minutes)."
        

        
        recettes.append(recette1)
        recettes.append(recette2)
        recettes.append(recette3)
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

extension RecettesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Get current episode
            let myRecette = recettes[indexPath.row]
            // Initialyze storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // Get controller
            let detailController = storyboard.instantiateViewController(withIdentifier: "DetailRecetteController") as! DetailRecetteController
            // Add params
            detailController.selectedRecette = myRecette
            // Push new view
            self.navigationController?.pushViewController(detailController, animated: true)
        }
}

extension RecettesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recettes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myRecette = recettes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecetteCellId") as! RecettesFullCell
    
        cell.name.text = myRecette.name
        cell.personnes.text = myRecette.personne
        cell.difficulte.text = myRecette.difficulte
        
        return cell
    }
}

