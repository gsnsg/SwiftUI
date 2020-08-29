//
//  FriendClass+CoreDataProperties.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendClass> {
        return NSFetchRequest<FriendClass>(entityName: "FriendClass")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var usersList: NSSet?

}

// MARK: Generated accessors for usersList
extension FriendClass {

    @objc(addUsersListObject:)
    @NSManaged public func addToUsersList(_ value: UserClass)

    @objc(removeUsersListObject:)
    @NSManaged public func removeFromUsersList(_ value: UserClass)

    @objc(addUsersList:)
    @NSManaged public func addToUsersList(_ values: NSSet)

    @objc(removeUsersList:)
    @NSManaged public func removeFromUsersList(_ values: NSSet)

}
