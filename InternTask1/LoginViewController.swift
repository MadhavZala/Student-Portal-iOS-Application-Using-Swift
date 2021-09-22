//
//  ViewController.swift
//  InternTask1
//
//  Created by Madhav on 01/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginEmailField: UITextField!
    
    @IBOutlet weak var loginPassField: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Sign-In Pressed
    @IBAction func signInPressed(_ sender: Any) {
        if loginEmailField.text?.isEmpty == true || loginPassField.text?.isEmpty == true {
            
            //Alert Email or Password not entered
            
            let alertController = UIAlertController(title: "", message: "Please Enter Email and Password!!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                       }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            if loginEmailField.text == userDefaults.string(forKey: "EmailKey") && loginPassField.text == userDefaults.string(forKey: "PassKey") {
                
                //Navigation to homepage
                let homepage:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
                
                self.navigationController?.pushViewController(homepage, animated: false)
                
                //Alert Login Successfully
                let alertController = UIAlertController(title: "", message: "Successfully Logged In!!", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                }
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            else {
                
                //Alert Email or Password Wrong
                
                let alertController = UIAlertController(title: "", message: "Wrong Email Or Password!!", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                           }
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
                loginPassField.text = ""
                
            }
        }
    }

    //MARK:- Create your Amazon Account Pressed
    @IBAction func createAccountPressed(_ sender: Any) {
        let signup:SignUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
}

