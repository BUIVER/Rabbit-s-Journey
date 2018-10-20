//
//  ClickerViewController.swift
//  map
//
//  Created by Ivan Ermak on 10/20/18.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit
import SpriteKit
class ClickerViewController: UIViewController {
    @IBOutlet weak var sunView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
      //  let sunmodel : UIImage = sunView.image!
        //sunView.image = sunmodel.addShadow()
       
        // Do any additional setup after loading the view.
    }
func assignbackground(){
    let background = UIImage(named: "Image")
    
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

}
extension UIImage {
    
    func addShadow(blurSize: CGFloat = 10.0) -> UIImage {
        let shadowColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9).cgColor
        //let shadowColor = UIColor(white:0.9, alpha:0.9).cgColor
        
        let context = CGContext(data: nil,
                                width: Int(self.size.width + blurSize),
                                height: Int(self.size.height + blurSize),
                                bitsPerComponent: self.cgImage!.bitsPerComponent,
                                bytesPerRow: 0,
                                space: CGColorSpaceCreateDeviceRGB(),
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        context.setShadow(offset: CGSize(width: -blurSize/2,height: -blurSize/2),
                          blur: blurSize,
                          color: shadowColor)
        context.draw(self.cgImage!,
                     in: CGRect(x: 0, y: blurSize, width: self.size.width, height: self.size.height),
                     byTiling:false)
        
        return UIImage(cgImage: context.makeImage()!)
    }
}
