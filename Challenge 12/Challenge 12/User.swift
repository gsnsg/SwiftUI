//
//  User.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation



struct User: Decodable, Hashable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var friends: [Friend]
    
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


class NetworkMananger: ObservableObject {
    @Published var users = [User]()
    
    
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
                        self.users = usersData
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
        print("Data received successfully!")
        
    }
}
