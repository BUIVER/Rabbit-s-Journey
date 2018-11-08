//
//  MapsViewController.swift
//  map
//
//  Created by Ivan Ermak on 05.07.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class MapsViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate  {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet weak var mapButton: UIBarButtonItem!
    
    var placesClient: GMSPlacesClient!

    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                        .joined(separator: "\n")
                }
            }
        })
    }
        
  
    var locationManager: CLLocationManager = CLLocationManager()
    
    var xCoor: Double = -33.86
    var yCoor: Double = 151.20
    var zoomCoor: Float = 5.0
    
    @IBOutlet weak var gMap: GMSMapView!

    var searchBar : UISearchBar?
    var mapData = [Data]()
    var MapData : Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = (self as CLLocationManagerDelegate)
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let camera = GMSCameraPosition.camera(withLatitude: xCoor, longitude: yCoor, zoom: zoomCoor)
        let mapView = GMSMapView.map(withFrame: self.gMap.frame, camera: camera)
        mapView.settings.zoomGestures = true
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        placesClient = GMSPlacesClient.shared()
       // debugPrint(mapView.myLocation ?? "empty value")
       //if(mapView.m)
       // mapView.myLocation?.coordinate.
        self.gMap.addSubview(mapView)
       mapButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
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
extension MapsViewController {
    // 2
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            gMap.isMyLocationEnabled = true
            gMap.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            gMap.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
        
    }
}
