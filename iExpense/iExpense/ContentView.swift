//
//  ContentView.swift
//  iExpense
//
//  Created by Nikhi on 10/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SheetDemo: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showSheet.toggle()
        }.sheet(isPresented: $showSheet) {
            SecondView()
        }
    }
}

struct OnDeleteDemo: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }.onDelete { offsets in
                        self.numbers.remove(atOffsets: offsets)
                    }
                }
                Button("Add numbers") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }.navigationBarItems(leading: EditButton())
        }
        
    }
}

//struct UserDefaults: View {
//
//    let name = UserDefaults.
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")
//    var body: some View {
//
//        VStack {
//            Text("Tap Count: \(tapCount)")
//            Button("Increment") {
//                self.tapCount += 1
//                UserDefaults.standard.set(self.tapCount, forKey: "tapCount")
//            }
//        }
//    }
//
//}

//class User: ObservableObject {
//    @Published var userName = "Frodo Baggins"
//    @Published var city = "Amsterdam"
//}

//struct ObservedDemo: View {
//    @ObservedObject var user = User()
//
//    var body: some View {
//        VStack {
//            Text("\(user.userName)")
//            TextField("Enter username:", text:$user.userName)
//        }.padding()
//    }
//}


struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    var body: some View {
        VStack {
            TextField("Enter first name", text: $firstName)
            TextField("Enter last name", text: $lastName)
            Button("Save me!") {
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
