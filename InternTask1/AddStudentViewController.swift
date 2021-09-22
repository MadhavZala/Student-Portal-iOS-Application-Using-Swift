//
//  AddStudentViewController.swift
//  InternTask1
//
//  Created by Madhav on 02/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var addStudentImg: UIImageView!
    
    @IBOutlet weak var addStudentFname: UITextField!
    
    @IBOutlet weak var addStudentLname: UITextField!
    
    @IBOutlet weak var addStudentEnrolNo: UITextField!
    
    @IBOutlet weak var addStudentDateOfBirth: UITextField!
    
    @IBOutlet weak var addStudentDepartment: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addStudentDateOfBirth.delegate = self
        addStudentImg.layer.masksToBounds = true
        addStudentImg.layer.cornerRadius = addStudentImg.bounds.width / 2
    }
    
    //MARK:- Add Student Pressed
    @IBAction func addStudentBtn(_ sender: UIButton) {
        
    // Alert Data Added Successfully
        if addStudentFname.text?.isEmpty == true && addStudentLname.text?.isEmpty == true && addStudentEnrolNo.text?.isEmpty == true && addStudentDateOfBirth.text?.isEmpty == true && addStudentDepartment.text?.isEmpty == true {
            let alertController = UIAlertController(title: "", message: "Enter All Data", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                               }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        }
        
        else {
            
            //For Content
            let dict = ["studentenrolment":addStudentEnrolNo.text,"studentfirstname":addStudentFname.text,"studentlastname":addStudentLname.text,"studentdateofbirth":addStudentDateOfBirth.text,"studentdepartment":addStudentDepartment.text]
            let jpg = (self.addStudentImg.image?.jpegData(compressionQuality: 0.75))!
                
            DatabaseHelper.shareInstance.save(object: dict as! [String: String], at: jpg)
            
            let alertController = UIAlertController(title: "", message: "Data Added Successfully!!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in
                                  }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
                   
            addStudentFname.text = ""
            addStudentLname.text = ""
            addStudentEnrolNo.text = ""
            addStudentDateOfBirth.text = ""
            addStudentImg.image = #imageLiteral(resourceName: "blog-ph")
            addStudentDepartment.text = ""
        }
        
   
    }
    
    
    //MARK:- Adding Student Image Pressed
    @IBAction func addStudentImageClicked(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addStudentImg.image = image
        }
        else {
            //Error Message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Back Button Pressed
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
        self.navigationController?.pushViewController(back, animated: false)
        
    }
}

extension AddStudentViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
}

//MARK:-Date Picker
extension AddStudentViewController{
    func openDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        addStudentDateOfBirth.inputView = datePicker //Keyboard
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelBtn, flexibleBtn, doneBtn], animated: false)
        addStudentDateOfBirth.inputAccessoryView = toolBar //Toolbar
    }
    
    @objc
    func cancelBtnClick() {
        addStudentDateOfBirth.resignFirstResponder()
    }
    
    @objc
    func doneBtnClick() {
        if let datePicker = addStudentDateOfBirth.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            addStudentDateOfBirth.text = dateFormatter.string(from: datePicker.date)
            print(datePicker.date)
        }
        addStudentDateOfBirth.resignFirstResponder()
    }
    
    @objc
    func datePickerHandler(datePicker: UIDatePicker) {
        print(datePicker.date)
    }
}
