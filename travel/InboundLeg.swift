//
//  InboundLeg.swift
//  travel
//
//  Created by Student on 23/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class InboundLeg: NSObject {
    
     var carrierIds : Array<Int> = Array()
     let originId : Int
     let destinationId : Int
     let departureDate : String



init(dictionary: [String : Any]) {
  
    if (dictionary["CarrierIds"] != nil) { self.carrierIds = (dictionary["CarrierIds"] as! NSArray) as! Array<Int>
    }
   self.originId = (dictionary["OriginId"] as? Int)!
    self.destinationId = (dictionary["DestinationId"] as? Int)!
    self.departureDate = (dictionary["DepartureDate"] as? String)!
}
}
