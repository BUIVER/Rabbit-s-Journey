//
//  LoadingViewController.swift
//  
//
//  Created by Ivan Ermak on 29.05.2018.
//

import UIKit
import Alamofire
import AlamofireImage
class LoadingViewController: UIViewController {
    
    var mapData = [Data]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMapList()
        
        while(mapData.count != 198)
        {}
        
        
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let mapTableViewController = segue.destination as? MapTableViewController
        
       
        
        
      
            mapTableViewController?.mapData = mapData
        
        }
        
        
    
    

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
                            /*   let area = JSON[index].value(forKey: "area") ?? 0.1
                             let borders = JSON[index].value(forKey: "borders") as! [String]
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
                                        /*   , altSpellings: altSpellings, area: area as! Double, borders:borders, callingCodes: callingCodes, capital:capital, cioc:cioc as! String, currencies:currencies as! [NSDictionary], demonym:demonym, gini:gini as! Double, languages:languages, latlng:latlng as! [Double], nativeName:nativeName, numericCode: numericCode as! String, population:population as! Int, region:region, regionalBlocs:regionalBlocs as! [NSDictionary], subregion:subregion, timezones:timezones, topLevelDomain :topLevelDomain, translations:translation as! [String : String])
                                         */
                                        guard let country = Data(name: name, flag: flag!, alpha2Code: alpha2code, alpha3Code: alpha3code, altSpellings: altSpellings)
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
