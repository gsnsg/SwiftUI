//
//  ContentView.swift
//  Animations Demo
//
//  Created by Nikhi on 08/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .foregroundColor(.white)
        .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(Animation.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//print(animationAmount)
//
//        return VStack {
//            Stepper("Scale ammount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            Spacer()
//
//            Button("Demo"){
//
//            }.background(Color.green)
//                .foregroundColor(.white)
//                .scaleEffect(animationAmount)
//            Spacer()
//            Button("Tap Me!") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//
//        }
