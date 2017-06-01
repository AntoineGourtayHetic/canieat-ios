//
//  ViewController.swift
//  userLocation

//

import UIKit
import MapKit
import CoreLocation


class HomeController: UIViewController, CLLocationManagerDelegate {
    
    var restaurants: [Restaurant] = [Restaurant]()
    //Map
    
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        
        self.map.showsUserLocation = true
    }
    
    func getRestaurantsData() {
        NetworkManager.getRestaurant { (restaurantFromAPI) in
            self.restaurants = restaurantFromAPI
            for restaurant in self.restaurants {
                print(restaurant.name)
            }

//            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        self.getRestaurantsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

