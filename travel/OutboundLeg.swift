//
//  OutboundLeg.swift
//  travel
//
//  Created by Student on 23/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class OutboundLeg: NSObject {
    
    let carrierIds : Array<Int> = Array()
    let originId : Int
    let destinationId : Int
    let departureDate : String
    
    init(dictionary: NSDictionary){
        
        
        
        if (dictionary["CarrierIds"] != nil) { (dictionary["CarrierIds"] as! NSArray) }
        originId = (dictionary["OriginId"] as? Int)!
        destinationId = (dictionary["DestinationId"] as? Int)!
        departureDate = (dictionary["DepartureDate"] as? String)!
        
    }

}
