//
//  HomepageViewController.swift
//  InternTask1
//
//  Created by Madhav on 02/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String: String]) 
}

class HomepageViewController: UIViewController, HamburgerViewControllerDelegate {
    
    var student = [Student] ()
    
    var delegate:DataPass!

    @IBOutlet weak var homepageTableView: UITableView!
    
    @IBOutlet weak var backViewForHamburger: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var hamburgerView: UIView!
    
    @IBOutlet weak var leadingConstraintForHamburgerView: NSLayoutConstraint!
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeSearchBar.delegate = self
        student = DatabaseHelper.shareInstance.getStudentData()
        usernameLabel.text = userDefaults.string(forKey: "NameKey")
        backViewForHamburger.isHidden = true
        
        homepageTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    var hamburgerViewController:HamburgerViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "hamburgerSegue") {
            if let controller = segue.destination as? HamburgerViewController {
                self.hamburgerViewController = controller
                self.hamburgerViewController?.delegate = self
            }
        }
    }
    
    @IBAction func addStudentHomepagePressed(_ sender: UIButton) {
        
        let addClicked:AddStudentViewController = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        
        self.navigationController?.pushViewController(addClicked, animated: true)
        
    }
    
    @IBAction func tappedOnHamburgerBackView(_ sender: UITapGestureRecognizer) {
        self.backViewForHamburger.isHidden = false
        self.hideHamburgerView()
    }
    
    func hideHamburgerMenu() {
        self.hideHamburgerView()
    }
    
    private func hideHamburgerView() {
        
        self.backViewForHamburger.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.leadingConstraintForHamburgerView.constant = 10
            self.view.layoutIfNeeded()
        }) {(_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.leadingConstraintForHamburgerView.constant = -280
                self.view.layoutIfNeeded()
            }) {(_) in
                self.backViewForHamburger.isHidden = true
            }
        }
    }
    
    @IBAction func showHamburgerMenuPressed(_ sender: UIButton) {
        
        self.backViewForHamburger.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.leadingConstraintForHamburgerView.constant = 10
            self.view.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.leadingConstraintForHamburgerView.constant = 0
                self.view.layoutIfNeeded()
            }) { (_) in
                self.backViewForHamburger.isHidden = false
            }
        }
    }
    
    
    
}


//MARK:- UITableViewDelegate
extension HomepageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail: DetailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detail.aFName = student[indexPath.row].studentfirstname
        detail.aLName = student[indexPath.row].studentlastname
        detail.aEnrol = student[indexPath.row].studentenrolment
        detail.aDOB = student[indexPath.row].studentdateofbirth
        detail.aDept = student[indexPath.row].studentdepartment
        if let detailImage = student[indexPath.row].studentimage {
            let coreDataImage = UIImage(data: detailImage)
            detail.aImg = coreDataImage
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
    //MARK:- Delete Row from TableView
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.homepageTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


//MARK:- UITableViewDataSource
extension HomepageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homepageTableView.dequeueReusableCell(withIdentifier: "AddStudentTableViewCell", for: indexPath) as! AddStudentTableViewCell
        
        cell.student = student[indexPath.row]
        if let imageData = student[indexPath.row].studentimage{
            let coreDataLoadedImage = UIImage(data: imageData)
            cell.studentImage.image = coreDataLoadedImage
        }
        return cell
    }
    
    
}

//MARK:- Search Bar
extension HomepageViewController: UISearchBarDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let dh = DatabaseHelper()
        
        if searchText != "" {
            student = dh.getSearchedData(sText: searchText)
            homepageTableView.reloadData()
        }
        
        else {
            student = dh.getStudentData()
            homepageTableView.reloadData()
        }
    }
}



