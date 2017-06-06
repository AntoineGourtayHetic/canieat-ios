//
//  Restaurant.swift
//  userLocation
//
//  Created by Yohan Atlan on 31/05/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import SwiftyJSON

class Restaurant: NSObject {
    var name: String!
    var imageUrl: String!
    var category: String!
    var latitude: Double!
    var longitude: Double!  
    var adress: String!
    var open: Bool!
    
    override init(){
        
    }
    init(json: JSON){
        //print(json)
        
        self.name = json["name"].stringValue
        self.imageUrl = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(json["photos"][0]["photo_reference"])&key=AIzaSyA8Jf9E6m_Rr_v_fd-rA7dQOtn1VnTR4zs"
        self.latitude = json["geometry"]["location"]["lat"].doubleValue
        self.longitude = json["geometry"]["location"]["lng"].doubleValue
        self.category = json[""].stringValue
        self.adress = json["vicinity"].stringValue
        self.open = json["opening_hours"]["open_now"].boolValue
    
    }
}
