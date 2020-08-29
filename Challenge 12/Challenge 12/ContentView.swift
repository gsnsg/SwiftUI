//
//  ContentView.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var networkManager = NetworkMananger()
    
//    var fetchRequest = FetchRequest<UserClass>(entity: UserClass.entity(), sortDescriptors: [])
//    
//    var fetchedResults: FetchedResults<UserClass> {
//        fetchRequest.wrappedValue
//    }
//    
//    @State var users = [UserClass]()
//    
//    // Dummy variable for reloading view
//    @State var reloadView = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(networkManager.users, id: \.self) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        HStack {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 50, height: 50)
                                Text("\(user.shortName)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                            VStack (alignment: .leading){
                                Text("\(user.wrappedName)")
                                    .font(.headline)
                                
                                Text("\(user.wrappedEmail)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                    
                }
            }
            .navigationBarTitle("Users")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
