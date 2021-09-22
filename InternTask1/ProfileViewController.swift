//
//  ProfileViewController.swift
//  InternTask1
//
//  Created by Madhav on 12/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit
let userDefaults = UserDefaults.standard

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = userDefaults.string(forKey: "NameKey")
        emailLabel.text = userDefaults.string(forKey: "EmailKey")
    }
    

    @IBAction func backToProfilePressed(_ sender: UIButton) {
        let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
        self.navigationController?.pushViewController(back, animated: false)
    }

}
