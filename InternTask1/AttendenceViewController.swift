//
//  AttendenceViewController.swift
//  InternTask1
//
//  Created by Madhav on 28/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import UIKit
import FSCalander

class AttendenceViewController: UIViewController {

    var calender:FSCalendar!
    var formatter = DateFormatter()
    let date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calender = FSCalendar(frame: CGRect(x: 0.0, y: 100.0, width: self.view.frame.size.width, height: 300.0))
        //calender.scope = .week
        //calender.locale = Locale(identifier: "hi")
        calender.scrollDirection = .vertical
        calender.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calender.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18.0)
        calender.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16.0)
        
        calender.appearance.todayColor = .systemBlue
        calender.appearance.weekdayTextColor = #colorLiteral(red: 0.4502736926, green: 0.2316464186, blue: 0.9384911656, alpha: 1)
        calender.appearance.headerTitleColor = #colorLiteral(red: 1, green: 0.8207300305, blue: 0.2964270413, alpha: 1)
        
        self.view.addSubview(calender)
        // Do any additional setup after loading the view.
        calender.delegate = self
        calender.dataSource = self
    }
    
    @IBAction func backToHomePressed(_ sender: UIButton) {
        
        let back:HomepageViewController = storyboard?.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
        self.navigationController?.pushViewController(back, animated: false)
        
    }
    
    

}


extension AttendenceViewController: FSCalendarDelegate, FSCalendarDataSource {
    //MARK:- Calender Delegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-YY"
        print("Date Selected == \(formatter.string(from: date))")
        
            let alertController = UIAlertController(title: "Today's Attendence Added ✅", message: "", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Okay", style: .default) {(action:UIAlertAction) in}
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
        
    }
    
    //MARK:- Calender DataSource
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
}
