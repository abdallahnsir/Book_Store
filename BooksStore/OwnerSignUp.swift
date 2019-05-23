//
//  CustomSignUp.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit
import FirebaseAuth

class OwnerSignUp: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    
    
    @IBAction func signButton(_ sender: UIButton) {
    
        //        if passwordTextField.text != repasswordTextField.text {
        //            print(" \n Error : must write your password correctly in Re-passowrd text ")
        //            return
        //        }
        if let myEnterEmail = emailTextField.text , let myEnterpassword = passwordTextfield.text{
            Auth.auth().createUser(withEmail: (myEnterEmail), password: (myEnterpassword)) { (auth, error) in
                if error != nil {
                    //something bad happning
                    print("\nERROR : \(String(describing: error)) ")
                }else{
                    //                    user registered successfully
                    if let myUID = Auth.auth().currentUser?.uid {
                        
                        
                        self.performSegue(withIdentifier: "OwnerAddItemPage", sender: nil)

                    }
                    
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
