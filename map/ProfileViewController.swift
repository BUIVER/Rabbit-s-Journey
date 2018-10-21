//
//  ProfileViewController.swift
//  map
//
//  Created by Ivan Ermak on 10/21/18.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    let db = Firestore.firestore()
   
    var ref : DocumentReference? = nil
    
    
    @IBAction func changePhoto(_ sender: Any) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let imageURL = info[.imageURL] as? URL
      //  let property = info[.]
            debugPrint(imageURL)
        // The info dictionary may contain multiple representations of the image. You want to use the original.
       // let avatarRef = storageRef.child("user_avatars/"\(imageURL))
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        profileImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let user = Auth.auth().currentUser!
        ref = db.collection("users").document((user.uid))
        ref?.getDocument{(document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
        self.usernameLabel.text = dataDescription?["name"] as! String
                self.loadingView.isHidden = true
        debugPrint(dataDescription?["name"])
                
               // usernameLabel.text = dataDescription()
            }
    
        // Do any additional setup after loading the view.

    
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
