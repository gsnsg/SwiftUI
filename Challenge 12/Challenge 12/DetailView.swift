//
//  DetailView.swift
//  Challenge 12
//
//  Created by Nikhi on 28/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let user: UserClass
    var body: some View {
        Form{
            
            Section(header: Text("NAME")) {
                Text(user.wrappedName)
            }
            
            Section(header: Text("EMAIL")) {
                Text(user.wrappedEmail)
            }
            
            Section(header: Text("ADDRESS")) {
                Text(user.wrappedAddress)
            }
            
            Section(header: Text("ABOUT")) {
                Text(user.wrappedAbout)
            }
            
            Section(header: Text("FRIENDS")) {
                List {
                    ForEach(user.friendList, id: \.self) { user in
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
                            Text(user.wrappedName)
                        }
                    }
                }
            }
        }.navigationBarTitle(Text(user.wrappedName), displayMode: .inline)
        
    }
}
