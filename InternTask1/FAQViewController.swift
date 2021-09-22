//
//  FAQViewController.swift
//  InternTask1
//
//  Created by Madhav on 12/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {
    
    @IBOutlet weak var faqTableView: UITableView!
    
    var arrQuestions = ["What is Swift Language?","What is Xcode?","Is xcode available for windows?","Can I build iOS apps on windows?","Why is Xcode not available for windows?"]
    var arrAnswers = ["Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community","Xcode is Apple's integrated development environment for macOS, used to develop software for macOS, iOS, iPadOS, watchOS, and tvOS. It was first released in 2003","Xcode is a sole macOS application, so that it is not possible to install Xcode on a Windows system.","Use Virtualbox and Install Mac OS on Your Windows PC. The quickest way to develop iOS apps on windows is with the help of a virtual machine.","Xcode is written in Objective-C and takes advantage of a number of OS X frameworks, so porting it to Windows would require porting all the frameworks on which Xcode relies."]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomePressed(_ sender: UIButton) {
        
        let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
               self.navigationController?.pushViewController(back, animated: false)
        
    }
    

}

extension FAQViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = faqTableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell") as! FAQTableViewCell
        cell.faqQuestionLabel.text = arrQuestions[indexPath.row]
        cell.faqAnswerLabel.text = arrAnswers[indexPath.row]
        return cell
    }
    
    
}

extension FAQViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}
