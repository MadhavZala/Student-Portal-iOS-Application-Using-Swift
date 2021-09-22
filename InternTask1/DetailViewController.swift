//
//  DetailViewController.swift
//  InternTask1
//
//  Created by Madhav on 02/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailStudentImage: UIImageView!
    
    @IBOutlet weak var detailFirstNameLabel: UILabel!
    
    @IBOutlet weak var detailEnrolLabel: UILabel!
    
    @IBOutlet weak var detailLastNameLabel: UILabel!
    
    @IBOutlet weak var detailDateOfBirthLabel: UILabel!
    
    @IBOutlet weak var detailDepartment: UILabel!
    
    var aFName : String?
    var aLName : String?
    var aEnrol : String?
    var aImg : UIImage?
    var aDOB: String?
    var aDept: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailFirstNameLabel.text = aFName
        detailLastNameLabel.text = aLName
        detailEnrolLabel.text = aEnrol
        detailStudentImage.image = aImg
        detailDateOfBirthLabel.text = aDOB
        detailDepartment.text = aDept
        

        detailStudentImage.layer.masksToBounds = true
        detailStudentImage.layer.cornerRadius = detailStudentImage.bounds.width / 2
    }
    
    @IBAction func backToHomeBtnPressed(_ sender: UIButton) {
            
            let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
            
            self.navigationController?.pushViewController(back, animated: false)
    }
}
