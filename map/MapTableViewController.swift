//
//  MapTableViewController.swift
//  map
//
//  Created by Ivan Ermak on 27.03.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import AlamofireImage
import os.log



class MapTableViewController: UITableViewController, UISearchBarDelegate {
   
    
    
    @IBOutlet weak var tableReloader: UITableView!
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var mapData  = [Data]()
    var saver = [Data]()
    var search : UISearchBar?
    //Search bar delegates
 
  /*  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.numberOfRows(inSection: 1)
        tableView.reloadData()
        
    }*/
   
    override func viewWillAppear(_ animated: Bool) {
        //viewLoading.
       mapData += saver
        searchBar.text = search?.text
        debugPrint(mapData)
        if(mapData.count == 0){
            loadMapList()}
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
   
        print(self.mapData.count)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* if(search?.text != nil)
        {
            return 1
        }
        else{*/
        return 198
       // }
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        let cellIdentifier = "MapTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MapTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MepTableViewCell.")
        }
        /*Alamofire.request("https://restcountries.eu/rest/v2/all", encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    // mapData
                    
                    print(self.mapData.count)
                    var i = 0
                    let JSON = result as! [NSDictionary]//as! [Data]//NSDictionary
                    
                    while(i < JSON.count)
                    {
                        
                        i+=1
                    }
                    print(JSON.count)
                    print(JSON[0].allKeys)
                    
                    
                   
                        let alpha2code = JSON[indexPath.row].value(forKey: "alpha2Code") as! String
                        let alpha3code = JSON[indexPath.row].value(forKey: "alpha3Code") as! String
                        let name = JSON[indexPath.row].value(forKey: "name") as! String
                        Alamofire.request("http://flags.fmcdn.net/data/flags/w1160/\(alpha2code.lowercased()).png").responseImage { response in
                            print(response)
                            if let status = response.response?.statusCode {
                                switch(status){
                                case 201:
                                    print("example success")
                                default:
                                    print("error with response status: \(status)")
                                }
                                
                                // print(type(of :response.result))
                                let flag = response.result.value
                                //  print(flag ?? "empty")
                                
                                
                                
                                if(flag != nil){
                                    guard let country = Data(name: name, flag: flag!, alpha2Code: alpha2code, alpha3Code: alpha3code)
                                        else {fatalError("error of init")}
                                    self.mapData += [country]
                                    print(self.mapData.count)
                                    
                                    
                                }
                                
                            }
                        }
                    }
                }
         
        if (search?.text != nil || search?.text != "" && mapData.count != 0)
        {
            for i in 0...197 {
            if (searchBar.text == mapData[i].name || searchBar.text == mapData[i].alpha3Code)
            {
                cell.CountryView.text = mapData[i].name
                cell.FlagView.image = mapData[i].flag
                cell.GeoCode.text = mapData[i].alpha3Code
                
            }
            }
        }
        else {*/
        if (mapData.count != 0){
            //tableView.reloadSections([1,2,3,4,5,6,7], with: UITableViewRowAnimation.fade)
            
        cell.CountryView.text = mapData[indexPath.row].name
        cell.FlagView.image = mapData[indexPath.row].flag
        cell.GeoCode.text = mapData[indexPath.row].alpha3Code
        
        if(cell.isHighlighted)
        {   cell.CountryView.text = mapData[indexPath.row].name
            cell.FlagView.image = mapData[indexPath.row].flag
            cell.GeoCode.text = mapData[indexPath.row].alpha3Code
            
            }
           
        }
        
        
        return cell
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
*/
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
            guard let mapDetailViewController = segue.destination as? DetailedViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
        
            guard let selectedMealCell = sender as? MapTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "") ")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMeal = mapData[indexPath.row]
            mapDetailViewController.search = searchBar
            mapDetailViewController.mapData = mapData
        mapDetailViewController.MapData = selectedMeal

        
    }
    

 
    //Private methods

    private func loadMapList(){
      
      
        if (mapData.count == 0){
        Alamofire.request("https://restcountries.eu/rest/v2/all", encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    // mapData
                    
                    print(self.mapData.count)
                    var i = 0
                    let JSON = result as! [NSDictionary]//as! [Data]//NSDictionary
                    
                    while(i < JSON.count)
                    {
                        
                        i+=1
                    }
                    print(JSON.count)
                    print(JSON[0].allKeys)
                    
                    
                    for index in 0...249
                    {
                       
                        let alpha2code = JSON[index].value(forKey: "alpha2Code") as! String
                        let alpha3code = JSON[index].value(forKey: "alpha3Code") as! String
                        let name = JSON[index].value(forKey: "name") as! String
                        let altSpellings = JSON[index].value(forKey: "altSpellings") as! [String]
                        let area = JSON[index].value(forKey: "area") ?? 0.1
                        
                        let borders = JSON[index].value(forKey: "borders") as! [String]
                        /*
                        let callingCodes = JSON[index].value(forKey: "callingCodes") as! [String]
                        let capital = JSON[index].value(forKey: "capital") as! String
                        let cioc = JSON[index].value(forKey: "cioc") ?? ""
                        let currencies = JSON[index].value(forKey: "currencies") ?? ["":""] //as! [NSDictionary]
                        let demonym = JSON[index].value(forKey: "demonym") as! String
                        let gini = JSON[index].value(forKey: "gini") ?? 0.0 
                        let languages = JSON[index].value(forKey: "languages") as! [NSDictionary]
                        let latlng = JSON[index].value(forKey: "latlng") ?? 0.0
                        let nativeName = JSON[index].value(forKey: "nativeName") as! String
                        let numericCode = JSON[index].value(forKey: "numericCode") ?? ""
                        let population = JSON[index].value(forKey: "population") ?? 0
                        let region = JSON[index].value(forKey: "region") as! String
                        let regionalBlocs = JSON[index].value(forKey: "regionalBlocs") ?? ["":""] //as! [NSDictionary]
                        let subregion = JSON[index].value(forKey: "subregion") as! String
                        let timezones = JSON[index].value(forKey: "timezones") as! [String]
                        let topLevelDomain = JSON[index].value(forKey: "topLevelDomain") as! [String]
                        let translation = JSON[index].value(forKey: "translation") ?? ["":""] //as! [String:String]?
                        */
                            Alamofire.request("http://flags.fmcdn.net/data/flags/w1160/\(alpha2code.lowercased()).png").responseImage { response in
                            print(response)
                            if let status = response.response?.statusCode {
                               /* switch(status){
                                case 201:
                                    print("example success")
                                default:
                                    print("error with response status: \(status)")
                                }
                                */
                                // print(type(of :response.result))
                                let flag = response.result.value
                                
                                //  print(flag ?? "empty")
                            
                                if(flag != nil){
                                 /*   , altSpellings: altSpellings, area: area as! Double, borders:borders, callingCodes: callingCodes, capital:capital, cioc:cioc as! String, currencies:currencies as! [NSDictionary], demonym:demonym, gini:gini as! Double, languages:languages, latlng:latlng as! [Double], nativeName:nativeName, numericCode: numericCode as! String, population:population as! Int, region:region, regionalBlocs:regionalBlocs as! [NSDictionary], subregion:subregion, timezones:timezones, topLevelDomain :topLevelDomain, translations:translation as! [String : String])
                                        */
                                    guard let country = Data(name: name, flag: flag!, alpha2Code: alpha2code, alpha3Code: alpha3code, altSpellings: altSpellings, area: area as! Double, borders: borders)
                                    else {fatalError("error of init")}
                                    self.mapData += [country]
                                    print(self.mapData.count)
                                    
                                   
                                }
                                
                            }
                             
                                self.mapData.sort(by: {$0.name < $1.name})
                                
                        }
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    



}
