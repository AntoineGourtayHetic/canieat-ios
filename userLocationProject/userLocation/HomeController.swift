//
//  ViewController.swift
//  userLocation

//

import UIKit
import MapKit
import CoreLocation


class HomeController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
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
            self.tableView.reloadData()
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
        tableView.delegate = self
        tableView.dataSource = self
        self.getRestaurantsData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}



 extension HomeController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get current episode
        let myRestaurant = restaurants[indexPath.row]
        // Initialyze storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Get controller
        let detailController = storyboard.instantiateViewController(withIdentifier: "DetailID") as! DetailViewController
        // Add params
        detailController.selectedRestaurant = myRestaurant
        // Push new view
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt: \(indexPath.row)")
        let myRestaurant = restaurants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantFullCell") as!RestaurantFullCell
        cell.restaurantName.text = myRestaurant.name
        return cell
    }
}

