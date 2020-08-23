//
//  ContentView.swift
//  Cupcakes
//
//  Created by Nikhi on 23/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI


class User: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case name
    }
   
    @Published var name = "Nikhit"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var  container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
}




struct ContentView: View {
    var body: some View {
        FormValidation()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
