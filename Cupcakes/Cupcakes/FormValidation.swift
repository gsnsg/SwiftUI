//
//  FormValidation.swift
//  Cupcakes
//
//  Created by Nikhi on 23/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct FormValidation: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }.disabled(disableForm)
        }
    }
}

struct FormValidation_Previews: PreviewProvider {
    static var previews: some View {
        FormValidation()
    }
}
