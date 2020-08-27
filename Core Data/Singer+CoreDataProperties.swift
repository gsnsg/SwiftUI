//
//  Singer+CoreDataProperties.swift
//  Core Data
//
//  Created by Nikhi on 27/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown First Name"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknowm Last Name"
    }
}
