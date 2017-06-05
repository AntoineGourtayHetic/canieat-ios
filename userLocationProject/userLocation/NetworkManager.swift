//
//  NetworkManager.swift
//  userLocation
//
//  Created by Yohan Atlan on 31/05/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class NetworkManager: NSObject{
    typealias RestaurantResult = ([Restaurant]) -> Void

    static func getRestaurant(completionHandler: @escaping RestaurantResult){
        Alamofire.request("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.8445548%2C2.4222176&radius=500&type=restaurant&keyword=vegan&key=AIzaSyA8Jf9E6m_Rr_v_fd-rA7dQOtn1VnTR4zs").responseJSON { (response)
            in
            switch response.result {
            case .failure(_):
                completionHandler([])
            
            case.success(_):
                let data = response.data
                let json = JSON(data)
                let restaurantArrayJSON = json["results"].arrayValue
                var arrayOfRestaurant = [Restaurant()]
                for restaurantJSON in restaurantArrayJSON{
                    let realRestaurant = Restaurant(json: restaurantJSON)
                    arrayOfRestaurant.append(realRestaurant)
                }
                completionHandler(arrayOfRestaurant)
            }
        }
    }
   }
