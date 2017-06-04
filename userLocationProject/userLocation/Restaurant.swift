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
    
    override init(){
        
    }
    init(json: JSON){
        self.name = json["name"].stringValue
        self.imageUrl = json[""].stringValue
        self.latitude = json["geometry"]["location"]["lat"].doubleValue
        self.longitude = json["geometry"]["location"]["lng"].doubleValue
        self.category = json[""].stringValue
    }
}
