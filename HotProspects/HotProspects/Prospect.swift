//
//  Prospect.swift
//  HotProspects
//
//  Created by Nikhi on 03/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation
import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}


class Prospects: ObservableObject {
    static let saveKey = "SavedData"
    
    @Published private(set) var people: [Prospect]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        self.people = []
    }
    
    private func save() {
        do {
            let encoded = try JSONEncoder().encode(self.people)
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
}
