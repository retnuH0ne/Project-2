//
//  restaurantObject.swift
//  Hackwich12
//
//  Created by Hunter Trujillo on 4/8/26.
//

import UIKit
import MapKit


class restaurantObject: NSObject, MKAnnotation {
    
let restaurantTitle: String?
let restaurantType: String?
let coordinate: CLLocationCoordinate2D
let fave: String?
    init(title: String, type: String, coordinate: CLLocationCoordinate2D, fave: String?)
    {
        self.restaurantTitle = title
        self.restaurantType = type
        self.coordinate = coordinate
        self.fave = fave
        
        super.init()
    }
    
    var subtitle: String?
    {
        return restaurantTitle
    }
    
    

}
