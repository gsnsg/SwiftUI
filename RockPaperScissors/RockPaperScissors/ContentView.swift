//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Nikhi on 05/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI


struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 70)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 1))
    }
}

extension View {
    func buttonDesign() -> some View {
        self.modifier(ButtonDesign())
    }
}

struct ContentView: View {
    
    @State private var score = 0
    @State var cpuChoice = "Nothing Yet"
    @State var showMessage = false
    
    private var choices = ["Rock", "Paper", "Scissors"]
    private var shouldWin = Bool.random()
    
    
    
    var body: some View {
        VStack {
            HStack() {
                Text("Score: \(score)").fontWeight(.bold)
                Spacer()
            }.padding(.vertical)
                .padding(.leading)
            
            Spacer()
            VStack {
                Text("CPU chose")
                    .padding(.bottom)
                Text(cpuChoice)
                    .font(.title)
                    .fontWeight(.bold)
                
            }
            
            
            Spacer()
            Text("Select a Choice").padding(.bottom)
            HStack {
                ForEach(0 ..< choices.count, id: \.self) { choice in
                    Button(self.choices[choice]) {
                        self.userSelected(choice)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.cpuChoice = "Nothing Yet"
                        }
                    }.buttonDesign()
                    
                }
            }
            Spacer()
            Text("Note: Please give atleast 3 seconds before choosing next choie")
                .fontWeight(.light)
                .font(.subheadline)
                .padding(.all)
        }
    }
    
    func userSelected(_ choice: Int) {
        let shouldWin = Bool.random()
        if shouldWin {
            self.score += 1
            if choice == 0 {
                cpuChoice = "Scissors"
            } else if choice == 1 {
                cpuChoice = "Rock"
            } else {
                cpuChoice = "Paper"
            }
        } else {
            cpuChoice = choices[(1 + choice) % 3]
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
