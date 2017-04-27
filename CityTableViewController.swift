//
//  CityTableViewController.swift
//  travel
//
//  Created by Duru Coskun on 24/04/2017.
//  Copyright © 2017 Ata Aygen. All rights reserved.
//

import UIKit

UIViewController, UITableViewDataSource,UITableViewDataSource,UITableViewDelegate, CityDataDelegate{
    
    @IBOutlet weak var cityTableView: UITableView!
    
    
    var cityDataSource = CityDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DESTINATIONS"
        cityDataSource.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "CityIdentifier",for: indexPath) as! CityTableViewCell
        let city = cityDataSource.destinations?[indexPath.row]
        
        
        print ("yasassssssssss")
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print (cityDataSource.destinations?.count)
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
