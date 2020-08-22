//
//  Activities.swift
//  Habits
//
//  Created by Nikhi on 22/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation


class Activities: ObservableObject {
    @Published var activities = [Activity]()
}


struct Activity: Identifiable, Codable {
    let id = UUID()
    var activityName: String
    var activityDescription: String
    var activityCount: Int?
    
}
