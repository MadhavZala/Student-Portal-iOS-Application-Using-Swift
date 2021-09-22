//
//  ChangePasswordViewController.swift
//  InternTask1
//
//  Created by Madhav on 14/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var currentPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordLabel: UILabel!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmNewPasswordLabel: UILabel!
    
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newPasswordLabel.isHidden = true
        newPasswordTextField.isHidden = true
        confirmNewPasswordLabel.isHidden = true
        confirmNewPasswordTextField.isHidden = true
        changePasswordButton.isHidden = true
    }
    
    @IBAction func backToHomePage(_ sender: UIButton) {
        
        let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
        self.navigationController?.pushViewController(back, animated: false)
        
    }
    
    @IBAction func checkCurrentPasswordButtonPressed(_ sender: UIButton) {
        
        if currentPasswordTextField.text?.isEmpty == true {
            let alertController = UIAlertController(title: "", message: "Please Enter Current Password", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if currentPasswordTextField.text != userDefaults.string(forKey: "PassKey") {
            let alertController = UIAlertController(title: "", message: "Incorrect Current Password", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
        
        else {
            newPasswordLabel.isHidden = false
            newPasswordTextField.isHidden = false
            confirmNewPasswordLabel.isHidden = false
            confirmNewPasswordTextField.isHidden = false
            changePasswordButton.isHidden = false
        }
        
    }
    
    @IBAction func changePasswordButtonPressed(_ sender: UIButton) {
        
        if currentPasswordTextField.text == newPasswordTextField.text {
            //Matching Password and Confirm Password
            let alertController = UIAlertController(title: "", message: "New Password same as Current password!!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            newPasswordTextField.text = ""
            confirmNewPasswordTextField.text = ""
        }
        
        if newPasswordTextField.text != confirmNewPasswordTextField.text {
            //NewPassword and current password same
            let alertController = UIAlertController(title: "", message: "Password and Confirm Password should be same!!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            newPasswordTextField.text = ""
            confirmNewPasswordTextField.text = ""
        }
        
        else {
            userDefaults.set(newPasswordTextField.text, forKey: "PassKey")
            
            let login:LoginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                       
            self.navigationController?.pushViewController(login, animated: true)
            
            //Password Changed
            let alertController = UIAlertController(title: "Password Changed", message: "Please login with New Password!!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
