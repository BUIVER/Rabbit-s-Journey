//
//  DetailedViewController.swift
//  map
//
//  Created by Ivan Ermak on 22.05.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {
    var borderList = [String]()
    func tableView(_ bordersTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (MapData?.borders.count)!
   }
 
    func tableView(_ bordersTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "bordersViewCell"
    guard let cell = bordersTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? bordersTableViewCell  else {
        fatalError("The dequeued cell is not an instance of MepTableViewCell.")
    }
        var borderText : String = "empty"
        for index in 0...197
        {
          if(MapData?.borders[indexPath.row].uppercased() == mapData[index].alpha3Code)
          {
            borderText = mapData[index].name
            break
            }
        }
    
      
       cell.labelBorders.text = borderText
        
        return cell
    
    }
    
   
    
 
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var exitButton: UIBarButtonItem!

    @IBOutlet weak var tableCell: UITableViewCell!
    @IBOutlet weak var bordersTable: UITableView!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var altSpelling: UILabel!
    @IBOutlet weak var alpha3Code: UILabel!
    @IBOutlet weak var alpha2Code: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
  
   
    var search : UISearchBar?
    var mapData = [Data]()
    var MapData : Data?
    override func viewWillAppear(_ animated: Bool) {
        
       infoButton.isEnabled = false
        flagImage.image = (MapData?.flag)
        nameLabel.text = MapData?.name
        alpha2Code.text = MapData?.alpha2Code
        alpha3Code.text = MapData?.alpha3Code
        var areastring = MapData?.area.description
        areastring = areastring! + " km²"
        area.text = areastring
       
        
      
        
       // for index in 0...MapData!.borders.count
      //  {
       // bordersWatcher?.dataSource = MapData?.borders as? UIPickerViewDataSource
        
        //}
        
       
        
       // altSpelling.text = (MapData?.altSpellings)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Mark: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
       let mapDetailViewController = segue.destination as? MapTableViewController
       
        let mapsViewController =  segue.destination as? MapsViewController
        
        
        
        if ((mapDetailViewController) != nil)
        {
        if (search?.text == nil){search?.text = ""}
        mapDetailViewController?.searchBar = search
        mapDetailViewController?.mapData = mapData
        }
        if ((mapsViewController) != nil)
        {
            if (search?.text == nil){search?.text = ""}
            mapsViewController?.searchBar = search
            mapsViewController?.mapData = mapData
            mapsViewController?.MapData = MapData
        }
        
        
    }
    

 
}

