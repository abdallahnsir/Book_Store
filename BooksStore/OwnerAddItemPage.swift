//
//  OwnerAddItemPage.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class OwnerAddItemPage: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    
    
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    var image1 : UIImage? = nil
    @IBAction func chooseImageButton(_ sender: UIButton) {
        ImagePickerManager().pickImage(self){ image in
            print("================================")
            
             self.image1 = image
            self.myImageView.image = image
            
            
        }
    }
    
    
    
    
    @IBAction func addNewItemButton(_ sender: Any) {
        
        

            let rendomNameImage = String.random()
            
            let storageRef = Storage.storage().reference().child("photos").child("\(rendomNameImage).jpg")
            //$$$$$$$$$$$$
            //            To load: let image = UIImage(data: data)
            let data = image1!.jpegData(compressionQuality: 0.5)
            //$$$$$$$$$$$$
            if let mydata = data {
                
                
                _ = storageRef.putData(mydata, metadata: nil) { (metadata, error) in
                    guard metadata != nil else {
//                        print("metadata ###############################")
                        return
                    }
                    // You can also access to download URL after upload.
                    storageRef.downloadURL { (url, error) in
                        guard url != nil else {
//                            print("url ###############################")
                            return
                        }
                        let myurl = url?.absoluteString
                        print("okay ###############################")
                        
                        let myidOfItem = UUID().uuidString
                        
                        let data = ["idOfItem": myidOfItem,
                                    "nameOfItem": self.nameTextField.text!,
                                    "priceOfItem": self.priceTextField.text!,
                                    "linkOfImage": myurl]
                        
                         Database.database().reference().child("items").child(myidOfItem).setValue(data)
                        
                    }
                }
            }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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




extension String {
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
