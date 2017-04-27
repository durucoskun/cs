//
//  Flight.swift
//  travel
//
//  Created by Student on 27/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class Flight: NSObject {
    let destinationCity : String
    let minPrice : Double
    let destinationCoutry : String
    let carrier : String
    let isDirect : Bool
    
    init(destinationCity : String, minPrice : Double , destinationCoutry : String , carrier : String, isDirect : Bool){
        self.destinationCity = destinationCity
        self.minPrice = minPrice
        self.destinationCoutry = destinationCoutry
        self.carrier = carrier
        self.isDirect = isDirect
        
    }


}
