//
//  ContentView.swift
//  Habits
//
//  Created by Nikhi on 22/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activityManager = Activities()
    
    @State private var presentSheet = false
    
    var body: some View {
        
        NavigationView{
            List(activityManager.activities) { activity in
                Text("\(activity.activityName)")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
            }
            .navigationBarTitle("Your Activities")
            .navigationBarItems(trailing: Button(action: {
                self.presentSheet.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $presentSheet) {
                    AddNewActivityView(activityManager: self.activityManager)
            }
        }.onAppear() {
            self.decodeData()
        }
        
    }
    
    func decodeData() {
        let decoder = JSONDecoder()
        
        if let data = UserDefaults.standard.object(forKey: "activities") {
            print("")
            let safeData = data as! Data
            do {
                let decodedData =  try decoder.decode([Activity].self, from: safeData)
                activityManager.activities = decodedData
                print("Data Decoded!")
            } catch {
                print("\(error.localizedDescription)")
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
