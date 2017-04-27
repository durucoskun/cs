//
//  HomePageViewController.swift
//  travel
//
//  Created by Ata Aygen on 13/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    let citydata = CityDataSource()
    
    @IBOutlet weak var departureLocation: UITextField!
    
    @IBOutlet weak var departureDate: UIDatePicker!
    @IBOutlet weak var returnDate: UIDatePicker!
    @IBOutlet weak var maxPrice: UITextField!
    
    @IBAction func go(_ sender: UIButton) {
        var url = "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/DE/EUR/en-US/\(departureLocation.text!)/anywhere/2017-05-01/2017-05-04?apiKey=at812187236421337946364002643367"
        citydata.loadCities(url: url, code: departureLocation.text!)
        
        //   citydata.loadCities(url: "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/DE/EUR/en-US/IST/anywhere/2017-05-01/2017-05-04?apiKey=at812187236421337946364002643367", code: IST)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if  let nextView = segue.destination as? CityViewController{
            nextView.cityDataSource = citydata
            
        }
        
        
     }
    
    
}
