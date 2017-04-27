//
//  CityDataSource.swift
//  travel
//
//  Created by Ata Aygen on 13/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import Foundation

@objc protocol CityDataDelegate{
    
    @objc optional func cityListLoaded()
    @objc optional func cityDetailsLoaded (place : Place)
    
}

class CityDataSource: NSObject {
    
    public var quotes : Array<Quote>?
    public var places : Array<Place>?
    public var carriers : Array<Carrier>?
    public var currencies : Array<Currency>?
    
    public var destinations : Array <NSDictionary>? = Array()
    
    
    var delegate : CityDataDelegate?
    
    func loadCities(url: String,code : String){
       
        
        let networkSession = URLSession.shared
        
        var req = URLRequest(url: URL(string: url)!)
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: req) {(data,response,error) in print("Data")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            // print(jsonReadable!)
            
            
            ////
            do
            {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                
                
                let quoteArray = jsonDictionary["Quotes"]! as! NSArray
                self.getQuotes(quoteArray: quoteArray)
                
                let placeArray = jsonDictionary["Places"]! as! NSArray
                self.getPlaces(placeArray : placeArray)
                
                let carrierArray = jsonDictionary["Carriers"]! as! NSArray
                self.getCarriers (carrierArray : carrierArray)
                
                let currencyArray = jsonDictionary["Currencies"]! as! NSArray
                //    self.currencies (currencyArray : currencyArray)
                
                self.checkDestinations(code: code)
                
            }
            catch
            {
                print("We have a JSON exception")
            }
            
        }
        
        
        
        ///////////////
        dataTask.resume()
        //        task.resume()
        
        //var request = URLRequest
    }
    
    func checkDestinations (code : String){
        
        var destination : Int
        for city in places!{
            let newCity = city as! Place
            
            if (newCity.code == code){
                let id = newCity.placeId
                // print ("Departure : \(newCity.cityName)")
                for quote in quotes!{
                    let newQuote = quote as! Quote
                    if (quote.outbound.originId == id){
                        destination =  quote.outbound.destinationId
                        for place in places!{
                            let   nextCity = place as! Place
                            
                            if (destination == nextCity.placeId){
                                //    print ("Departure : \(newCity.cityName) -->Destination : \(nextCity.cityName)")
                                let destinationDictionary : [String : Any] = ["DestinationCity":nextCity.cityName!,"MinPrice" :quote.minPrice,"Country":nextCity.countryName]
                                
                               ( destinations?.append(destinationDictionary as NSDictionary))!
                                
                            }
                            
                        }
                        
                        
                        
                    }
                }
                
            }
        }
        
       
        loadCityList()
    }
    func getQuotes(quoteArray : NSArray){
        
        quotes = Array()
        for quote in quoteArray{
            let quoteDictionary = quote as! NSDictionary
            
            let newQuote = Quote(quoteId :quoteDictionary["QuoteId"]! as! Int ,
                                 minPrice : quoteDictionary ["MinPrice"]! as! Double,
                                 direct : quoteDictionary["Direct"]! as! Bool,
                                 outbound :OutboundLeg(dictionary :(quoteDictionary["OutboundLeg"]! as! NSDictionary) as! [String : Any] as NSDictionary),
                                 inbound:InboundLeg(dictionary: (quoteDictionary["InboundLeg"]! as! NSDictionary) as! [String : Any]),
                                 date : quoteDictionary["QuoteDateTime"]! as! String)
            
            (quotes?.append(newQuote))!
        }
        
    }
    
    func getPlaces (placeArray : NSArray){
        places = Array()
        for place in placeArray{
            
            let placeDictionary = place as! NSDictionary
            
            if (placeDictionary.count > 4){
                
                let newPlace = Place (placeId : placeDictionary["PlaceId"]! as! Int ,
                                      IataCode : placeDictionary ["IataCode"]! as! String,
                                      name : placeDictionary ["Name"]! as! String,
                                      type : placeDictionary["Type"]! as! String,
                                      code : placeDictionary["SkyscannerCode"]! as! String,
                                      cityName : placeDictionary ["CityName"]! as! String,
                                      cityId : placeDictionary["CityId"]! as! String,
                                      countryName : placeDictionary["CountryName"]! as! String
                )
                
                (places?.append(newPlace))!
                
            }
            
        }
    }
    
    func getCarriers(carrierArray : NSArray){
        carriers = Array()
        for carrier in carrierArray{
            let carrierDictionary = carrier as! NSDictionary
            
            let newCarrier = Carrier(id : carrierDictionary["CarrierId"]! as! Int , name: carrierDictionary["Name"]! as! String)
            
            carriers?.append(newCarrier)
            
        }
        
    }
    
    func getCurrencies (currencyArray : NSArray){
        currencies = Array()
    }
    
    
    func loadCityList(){
        
  
              for dest in destinations!{
            
            let new = dest as! NSDictionary
         
          //  print ("To \(new["DestinationCity"]!)Min Price is \( new ["MinPrice"]!)")
            
            
        }
        
        
        
    }
    
  
    
    
}
