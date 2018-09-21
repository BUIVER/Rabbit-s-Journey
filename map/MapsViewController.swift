//
//  MapsViewController.swift
//  map
//
//  Created by Ivan Ermak on 05.07.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate  {
   
    @IBOutlet weak var mapButton: UIBarButtonItem!
    
    @IBOutlet var zoomOut: UIPinchGestureRecognizer!
  
    var locationManager: CLLocationManager = CLLocationManager()
    
    var xCoor: Double = -33.86
    var yCoor: Double = 151.20
    var zoomCoor: Float = 5.0
    
    @IBOutlet weak var gMap: GMSMapView!
    @IBAction func ZoomingOut(_ sender: UIPinchGestureRecognizer) {
       // if(zoomOut.state == UIGestureRecognizerState.began)
       // {
      //      zoomOut.scale.
       // }
       if let view = sender.view
        {
        view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
            //zoomCoor
        }
    }
  
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
        debugPrint(mapView.myLocation ?? "empty value")
       //if(mapView.m)
       // mapView.myLocation?.coordinate.
        self.view.addSubview(mapView)
       mapButton.isEnabled = false
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
