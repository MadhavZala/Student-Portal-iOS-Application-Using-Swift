//
//  SignUpViewController.swift
//  InternTask1
//
//  Created by Madhav on 02/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit
import SafariServices



class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signupNameField: UITextField!
    
    @IBOutlet weak var signupEmailField: UITextField!
    
    @IBOutlet weak var signupPassField: UITextField!
    
    @IBOutlet weak var signupRePassField: UITextField!
    
    @IBOutlet weak var signupTermsCheckBox: UIButton!
    
    let userDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Create New Account Pressed
    
    @IBAction func signupCreateAcountPressed(_ sender: Any) {
        if signupNameField.text?.isEmpty == true || signupEmailField.text?.isEmpty == true || signupPassField.text?.isEmpty == true || signupRePassField.text?.isEmpty == true || signupTermsCheckBox.isSelected == false {
            
            //Alert If all data not entered
            let alertController = UIAlertController(title: "", message: "Please Enter All Details and Accept Terms of Service", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            
            if signupPassField.text != signupRePassField.text {
                //Matching Password and Confirm Password
                let alertController = UIAlertController(title: "", message: "Password and Confirm Password should be same!!", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                }
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
                signupRePassField.text = ""
                signupPassField.text = ""
                signupTermsCheckBox.isSelected = false
            }
            
            else {
                userDefaults.set(signupNameField.text, forKey: "NameKey")
                userDefaults.set(signupEmailField.text, forKey: "EmailKey")
                userDefaults.set(signupPassField.text, forKey: "PassKey")
                userDefaults.set(signupRePassField.text, forKey: "RePassKey")
                           
                //Navigating to login page
                let home:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
                                      
                self.navigationController?.pushViewController(home, animated: false)
                           
                //Alert Registered Successfully
                let alertController = UIAlertController(title: "", message: "Successfully Registered!!", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in}
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK:- CheckBox Pressed
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
            
    }
    
    
    //MARK:- Terms and Condition Button
    @IBAction func termsPressed(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.servicenow.com/demo-terms-of-use.html")!)
        present(vc, animated: true)
    }
    
    //MARK:- Back To Login Page Pressed
    @IBAction func signInPressed(_ sender: UIButton) {
        
        //Navigating to login page
        let back:LoginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                   
        self.navigationController?.pushViewController(back, animated: true)
        
    }
    
    
}
