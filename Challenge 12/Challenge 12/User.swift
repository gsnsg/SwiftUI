//
//  User.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI
import CoreData


struct User: Decodable, Hashable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var friends: [Friend]
    
    var wrappedName: String {
        name
    }
    
    var firstName: String {
        return String(name.split(separator: " ").first!)
    }
    
    var lastName: String {
        return String(name.split(separator: " ").last!)
    }
    
    var shortName: String {
        return String(firstName.first!) + String(lastName.first!)
    }
    
    
    var wrappedEmail: String {
        email
    }
}


struct Friend: Decodable, Hashable {
    var id: String
    var name: String
    
    var firstName: String {
        return String(name.split(separator: " ").first!)
    }
    
    var lastName: String {
        return String(name.split(separator: " ").last!)
    }
    
    var shortName: String {
        return String(firstName.first!) + String(lastName.first!)
    }
}


class NetworkMananger: ObservableObject{
    @Published var users = [UserClass]()
    
    private var userData = [User]()
    
    
    init() {
        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        let request = NSFetchRequest<UserClass>(entityName: "UserClass")
        
        
        do {
            let fetchedResults = try moc.fetch(request)
            print("Got the data")
            if fetchedResults.isEmpty {
                fetchUsers()
            } else {
                users = fetchedResults
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL!")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let safeData = data {
                let decoder = JSONDecoder()
                
                do {
                    let usersData = try decoder.decode([User].self, from: safeData)
                    DispatchQueue.main.async {
                        self.userData = usersData
                        self.saveUsers()
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
        print("Data received successfully!")
    }
    
    
    func saveUsers() {
        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        
        var friendMap = [String : FriendClass]()
        
        for user in userData {
            let newUser = UserClass(context: moc)
            newUser.id = user.id
            newUser.name = user.name
            newUser.email = user.email
            newUser.about = user.about
            newUser.address = user.address
            
            var friendsList = [FriendClass]()
            
            for friend in user.friends {
                if let safeFriend = friendMap[friend.id] {
                    friendsList.append(safeFriend)
                } else {
                    let newFriend = FriendClass(context: moc)
                    newFriend.id = friend.id
                    newFriend.name = friend.name
                    friendMap[friend.id] = newFriend
                }
            }
            
            newUser.friends = NSSet(array: friendsList)
            
            users.append(newUser)
        }
        if moc.hasChanges {
            try? moc.save()
        }
        print("Data saved to local storage", users.count)
    }
    
    
}

