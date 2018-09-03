//
//  MapsViewController.swift
//  map
//
//  Created by Ivan Ermak on 05.07.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    @IBOutlet weak var gMap: UIView!
   
    var searchBar : UISearchBar?
    var mapData = [Data]()
    var MapData : Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.gMap.frame, camera: camera)
        self.view.addSubview(mapView)
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
        
        let mapDetailViewController = segue.destination as? DetailedViewController
        let mapTableViewController = segue.destination as? MapTableViewController
  
        
        
        
        if ((mapDetailViewController) != nil)
        {
            if (searchBar?.text == nil){searchBar?.text = ""}
            mapDetailViewController?.search = searchBar
            mapDetailViewController?.mapData = mapData
            mapDetailViewController?.MapData = MapData
        }
        
        if ((mapTableViewController) != nil)
        {
            if (searchBar?.text == nil){mapTableViewController?.search = searchBar}
            
            mapTableViewController?.mapData = mapData
            
        }
        
        
        
    }

}
