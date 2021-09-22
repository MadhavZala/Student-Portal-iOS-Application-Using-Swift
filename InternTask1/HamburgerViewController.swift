//
//  HamburgerViewController.swift
//  InternTask1
//
//  Created by Madhav on 11/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit
import SafariServices

protocol HamburgerViewControllerDelegate {
    func hideHamburgerMenu()
}

class HamburgerViewController: UIViewController {
    
    var delegate: HamburgerViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func profilePressed(_ sender: UIButton) {
        let profile:ProfileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        self.navigationController?.pushViewController(profile, animated: false)
    }

    @IBAction func changePasswordPressed(_ sender: UIButton) {
        
        let change:ChangePasswordViewController = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        
        self.navigationController?.pushViewController(change, animated: false)
        
    }
    
    
    @IBAction func faqPressed(_ sender: UIButton) {
        
        let faq:FAQViewController = storyboard?.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
        
        self.navigationController?.pushViewController(faq, animated: false)
        
    }
    
    
    @IBAction func contactAdminPressed(_ sender: UIButton) {
        
        
        let vc = SFSafariViewController(url: URL(string: "https://www.apple.com/in/contact/")!)
        present(vc, animated: true)
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        //Navigation to Login
        let logout:LoginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(logout, animated: false)
        
        //Alert Logout Successfully
        let alertController = UIAlertController(title: "", message: "Successfully Logged Out!!", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
