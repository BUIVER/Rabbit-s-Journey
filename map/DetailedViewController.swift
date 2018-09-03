//
//  DetailedViewController.swift
//  map
//
//  Created by Ivan Ermak on 22.05.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var exitButton: UIBarButtonItem!
    
    @IBOutlet weak var tapBars: UITabBar!
    @IBOutlet weak var listBar: UITabBarItem!
    
    @IBOutlet weak var altSpelling: UILabel!
    @IBOutlet weak var alpha3Code: UILabel!
    @IBOutlet weak var alpha2Code: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    /*func tabBar(tabBars: UITabBar, didSelect item: UITabBarItem) {
        
    }*/
    var search : UISearchBar?
    var mapData = [Data]()
    var MapData : Data?
    override func viewWillAppear(_ animated: Bool) {
        flagImage.image = (MapData?.flag)
        nameLabel.text = MapData?.name
        alpha2Code.text = MapData?.alpha2Code
        alpha3Code.text = MapData?.alpha3Code
        
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
