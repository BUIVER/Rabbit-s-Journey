//
//  DetailedViewController.swift
//  map
//
//  Created by Ivan Ermak on 22.05.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var exitButton: UIBarButtonItem!
    
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var mapData = [Data]()
    var MapData : Data?
    override func viewWillAppear(_ animated: Bool) {
        flagImage.image = (MapData?.flag)!
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
        
        guard let mapDetailViewController = segue.destination as? MapTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
       
       
        mapDetailViewController.mapData = mapData
      
        
        
    }
    

}
