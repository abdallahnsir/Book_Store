//
//  MarketLogIn.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit
import FirebaseAuth

class MarketLogIn: UIViewController {

    @IBOutlet weak var EnterEmail: UITextField!
    @IBOutlet weak var EnterPassword: UITextField!
    
    
    
    
    @IBAction func ButtonLogIn(_ sender: Any) {
        
        if let myEnterEmail = EnterEmail.text , let myEnterpassword = EnterPassword.text{
            Auth.auth().signIn(withEmail: (myEnterEmail), password: (myEnterpassword)) { (result, error) in
                if error != nil{
                    print("ERROR : \(String(describing: error)) ")
                }else{
                    print("yeah")

                    self.performSegue(withIdentifier: "OwnerAddItemPage2", sender: nil)
                }
            }
        }
    }
    
        @IBAction func ButtonForgotPass(_ sender: UIButton) {
            self.performSegue(withIdentifier: "ResetPage", sender: nil)
        }
    
    
    @IBAction func ButtonSignUp(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ToSignUpPage", sender: nil)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    

        if Auth.auth().currentUser != nil {
            
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "OwnerAddItemPage2", sender: nil)
            }
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
