//
//  Place.swift
//  travel
//
//  Created by Student on 22/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class Place: NSObject {
    
    let placeId : Int
    let IataCode : String
    let name : String
    let type : String
    let code : String
    let cityName : String?
    let cityId : String
    let countryName : String
    
    init (placeId : Int,IataCode :String , name : String , type : String,
          code : String, cityName : String, cityId : String, countryName : String){
        
        self.placeId = placeId
        self.name = name
        self.type = type
        self.code = code
        self.IataCode = IataCode
        self.cityId = cityId
        self.cityName = cityName
        self.countryName = countryName
        
    }
    
}
