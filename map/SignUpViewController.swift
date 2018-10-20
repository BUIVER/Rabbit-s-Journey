//
//  SignUpViewController.swift
//  map
//
//  Created by Ivan Ermak on 10/20/18.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmed: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func SIgnUpUser(_ sender: Any) {
        var checker : Int = 0
        if isValidEmail(testStr: emailField.text ?? "")
        {
            emailLabel.textColor = .black
            checker += 1
        }
        else {emailLabel.textColor = .red}
        if (passwordField.text != "" && passwordField.text != nil)
        {
            passwordLabel.textColor = .black
            checker += 1
        }
        else {passwordLabel.textColor = .red}
        if (passwordField.text == passwordConfirmed.text)
        {
            confirmPasswordLabel.textColor = .black
            checker += 1
        }
        else {confirmPasswordLabel.textColor = .red}
        if (username.text != "" && username.text != nil)
        {
            usernameLabel.textColor = .black
            checker += 1
        }
        else {usernameLabel.textColor = .red}
        
        if (checker == 4)
        {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
            }
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                // ...
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
