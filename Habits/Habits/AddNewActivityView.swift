//
//  AddNewActivityView.swift
//  Habits
//
//  Created by Nikhi on 22/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct AddNewActivityView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var activityName: String = ""
    @State private var activityDescription: String = ""
    
    var activityManager: Activities
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity Name", text: $activityName)
                TextField("Activity Description", text: $activityDescription)
            }
            .padding(.top)
            .navigationBarTitle("New Activity")
            .navigationBarItems(trailing: Button(action: {
                let newActivity = Activity(activityName: self.activityName, activityDescription: self.activityDescription)
                
                self.activityManager.activities.append(newActivity)
                self.encodeData()
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done")
            }))
        }
    }
    
    func encodeData() {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(activityManager.activities)
            UserDefaults.standard.set(data, forKey: "activities")
            print("Data Encoded!")
        } catch {
            print("\(error.localizedDescription)")
        }
        
        
        
    }
}

struct AddNewActivityView_Previews: PreviewProvider {
    static let manager = Activities()
    static var previews: some View {
        AddNewActivityView(activityManager: manager)
    }
}
