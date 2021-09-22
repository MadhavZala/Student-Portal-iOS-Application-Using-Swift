//
//  AddStudentTableViewCell.swift
//  InternTask1
//
//  Created by Madhav on 02/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class AddStudentTableViewCell: UITableViewCell {
    
    @IBOutlet var studentImage: UIImageView!
    @IBOutlet var studentFirstNameLabel: UILabel!
    @IBOutlet var studentLastNameLabel: UILabel!
    @IBOutlet var studentEnrolNumberLabel: UILabel!
    @IBOutlet var studentDateOfBirth: UILabel!
    @IBOutlet var studentDepartment:UILabel!
    
    
    var student: Student! {
        didSet{
            studentFirstNameLabel.text = student.studentfirstname
            studentLastNameLabel.text = student.studentlastname
            studentEnrolNumberLabel.text = student.studentenrolment
            studentDateOfBirth.text = student.studentdateofbirth
            studentDepartment.text = student.studentdepartment
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        studentImage.layer.masksToBounds = true
        studentImage.layer.cornerRadius = studentImage.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
