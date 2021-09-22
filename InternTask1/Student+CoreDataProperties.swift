//
//  Student+CoreDataProperties.swift
//  InternTask1
//
//  Created by Madhav on 03/06/21.
//  Copyright © 2021 Madhav Zala. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var studentfirstname: String?
    @NSManaged public var studentlastname: String?
    @NSManaged public var studentenrolment: String?
    @NSManaged public var studentimage: Data?
    @NSManaged public var studentdateofbirth: String?
    @NSManaged public var studentdepartment: String?

}
