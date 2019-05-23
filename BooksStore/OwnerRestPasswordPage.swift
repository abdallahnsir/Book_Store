//
//  OwnerRestPasswordPage.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit
import FirebaseAuth

class OwnerRestPasswordPage: UIViewController {

    
    
    @IBOutlet weak var enterEmail: UITextField!
    
    @IBAction func ResetButton(_ sender: Any) {
        
        if let email = enterEmail.text {
            Auth.auth().sendPasswordReset(withEmail: email) { (myError:Any?) in
                if myError != nil{
                    print ("there is a problem in Reset password \(String(describing: myError))")
                }else {
                    
                    
                    let alert = UIAlertController(title: "Note!", message: "Please check your email!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) in
                    
                                self.dismiss(animated: true, completion: nil)
                        }))

                    self.present(alert, animated: true, completion: nil)
                    

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
