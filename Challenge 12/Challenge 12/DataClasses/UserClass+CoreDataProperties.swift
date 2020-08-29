//
//  UserClass+CoreDataProperties.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//
//

import Foundation
import CoreData


extension UserClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserClass> {
        return NSFetchRequest<UserClass>(entityName: "UserClass")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var id: String?
    @NSManaged public var friends: NSSet?

}

// MARK: Generated accessors for friends
extension UserClass {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendClass)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendClass)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
