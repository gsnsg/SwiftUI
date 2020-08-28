//
//  DetailView.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let user: User
    var body: some View {
        Form{
            
            Section(header: Text("NAME")) {
                Text(user.name)
            }
            
            Section(header: Text("EMAIL")) {
                Text(user.email)
            }
            
            Section(header: Text("ADDRESS")) {
                Text(user.address)
            }
            
            Section(header: Text("ABOUT")) {
                Text(user.about)
            }
            
            Section(header: Text("FRIENDS")) {
                List {
                    ForEach(user.friends, id: \.self) { user in
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
                            Text(user.name)
                        }
                    }
                }
            }
        }.navigationBarTitle(Text(user.name), displayMode: .inline)
        
    }
}
