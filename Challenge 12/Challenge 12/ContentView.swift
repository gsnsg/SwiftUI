//
//  ContentView.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkMananger()
    
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
                                Text("\(user.firstName) \(user.lastName)")
                                    .font(.headline)
                                
                                Text("\(user.email)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    
                    
                }
            }
            .navigationBarTitle("Users")
            .onAppear(perform: networkManager.fetchUsers)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
