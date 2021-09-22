//
//  DatabaseHelper.swift
//  InternTask1
//
//  Created by Madhav on 03/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK:- Save Content
    func save(object:[String:String], at imgData:Data) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.studentfirstname = object["studentfirstname"]
        student.studentlastname = object["studentlastname"]
        student.studentenrolment = object["studentenrolment"]
        student.studentdateofbirth = object["studentdateofbirth"]
        student.studentdepartment = object["studentdepartment"]
        student.studentimage = imgData
        do {
            try context.save()
        } catch {
            print("data is not saved")
        }
    }
    
    //MARK:- Data Show
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context.fetch(fetchRequest) as! [Student]
        } catch{
                print("Cannot get data")
        }
        return student
    }
    
    //MARK:- Data Delete
    func deleteData(index: Int) -> [Student] {
        var student = getStudentData()
        context.delete(student[index])
        student.remove(at: index)
        do {
            try context.save()
        } catch {
            print("Cannot Delete Data")
        }
        return student
    }
    
    //MARK:- Search Data
    func getSearchedData(sText:String) -> [Student] {
        var student = [Student]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let predicate = NSPredicate(format: "studentdepartment contains %@", sText)
        let request: NSFetchRequest = Student.fetchRequest()
        request.predicate = predicate
        do {
            student = try (context.fetch(request))
        } catch {
            print("Error while fetching data")
        }
        return student
    }
}
