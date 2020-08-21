//
//  ContentView.swift
//  demi
//
//  Created by Nikhi on 05/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.largeTitle)
    }
}

extension View {
    func primaryLabel() -> some View {
        self.modifier(PrimaryLabel())
    }
}
struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .primaryLabel()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
