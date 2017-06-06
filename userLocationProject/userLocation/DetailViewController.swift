//
//  DetailViewController.swift
//  userLocation
//
//  Created by Yohan Atlan on 02/06/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var button_go: UIButton!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var open: UILabel!
    
    var selectedRestaurant = Restaurant()
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = selectedRestaurant.name
        print(selectedRestaurant.imageUrl)
        let url = URL(string: selectedRestaurant.imageUrl)!
        imageView.af_setImage(withURL: url)
        adress.text = selectedRestaurant.adress
        if selectedRestaurant.open == true {
            open.text = "Ouvert"
        }
        else{
            open.text = "Fermé"
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button_goPressed(_ sender: UIButton) {
        let latitude: CLLocationDegrees = selectedRestaurant.latitude
        let longitude: CLLocationDegrees = selectedRestaurant.longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = selectedRestaurant.name
        mapItem.openInMaps(launchOptions: options)
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
