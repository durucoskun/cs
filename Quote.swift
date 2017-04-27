//
//  Quote.swift
//  travel
//
//  Created by Student on 22/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    let quoteId: Int
    let minPrice : Double?
    let direct : Bool
    var outbound : OutboundLeg
       var inbound : InboundLeg
    let date : String
    
    init (quoteId : Int , minPrice : Double, direct : Bool , outbound : OutboundLeg ,inbound:InboundLeg, date : String){
        self.quoteId = quoteId
        self.minPrice = minPrice
        self.direct = direct
        self.outbound = outbound
        self.inbound = inbound
        self.date = date
        
    }
  

}
