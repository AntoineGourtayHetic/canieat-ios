//
//  ViewController.swift
//  userLocation

//

import UIKit
import MapKit
import CoreLocation
import AlamofireImage


class HomeController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var restaurants: [Restaurant] = [Restaurant]()
    //Map
    
    @IBOutlet weak var map: MKMapView!
    
    
    let manager = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.03, 0.03)
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
                //print(restaurant.name)
            }
            self.tableView.reloadData()
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
        if indexPath.row > 0 {
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
        else{
            print("Map")
        }
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myRestaurant = restaurants[indexPath.row]
        
        var cell: UITableViewCell?
        if indexPath.row >= 1 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: myRestaurant.latitude, longitude: myRestaurant.longitude)
            map.addAnnotation(annotation)

            let cell2 = tableView.dequeueReusableCell(withIdentifier: "RestaurantFullCell", for: indexPath) as! RestaurantFullCell
            cell2.restaurantName.text = myRestaurant.name
            let url = URL(string: myRestaurant.imageUrl)!
            cell2.restaurantImage.af_setImage(withURL: url)
            cell2.restaurantImage.layer.cornerRadius = 10
            cell = cell2
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
        }
      return cell!
    }
    
    @objc(tableView:heightForRowAtIndexPath:) public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.row == 0 {
            return 400
        }
        else{
            return 190
        }
    }
}
