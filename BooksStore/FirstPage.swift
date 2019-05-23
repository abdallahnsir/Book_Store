//
//  ViewController.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit

class FirstPage: UIViewController {

    @IBAction func customer(_ sender: UIButton) {
//            self.performSegue(withIdentifier: "asACustomer", sender: nil)
    }
    
    @IBAction func owner(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

