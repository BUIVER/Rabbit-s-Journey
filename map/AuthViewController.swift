//
//  AuthViewController.swift
//  map
//
//  Created by Ivan Ermak on 10/20/18.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {
    
    
    private var login : String = ""
    private var password: String = ""
    var mapData = [Data]()
    var ref: DocumentReference? = nil
    var userdata : AuthDataResult!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var ResetPassword: UIButton!
    @IBOutlet weak var loginField: UITextField!
    @IBAction func checkForLog(_ sender: Any) {
        if(passwordField.text != "")
        {
            LogIn.isEnabled = true
        }
    }
    @IBAction func LogIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginField.text ?? "", password: passwordField.text ?? "") { (user, error) in
            debugPrint(user?.user)
            self.userdata = user!
            
            
            }
        }
    
    
    @IBOutlet weak var LogIn: UIButton!
    override func viewDidLoad() {
        LogIn.isEnabled = true
        super.viewDidLoad()
        assignbackground()
       SignUp.layer.cornerRadius = 10
        LogIn.layer.borderWidth = 3
        ResetPassword.layer.cornerRadius = 10
        LogIn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    func assignbackground(){
        let background = UIImage(named: "background")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let ProfileViewSegue = segue.destination as? ProfileViewController
        let MapsSegue = segue.destination as? MapsViewController
        let ListSegue = segue.destination as? MapTableViewController
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    

}
