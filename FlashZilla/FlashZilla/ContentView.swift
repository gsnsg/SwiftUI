//
//  ContentView.swift
//  FlashZilla
//
//  Created by Nikhi on 03/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
struct ContentView: View {
    
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    ForEach(0 ..< cards.count) { cardNumber in
                        CardView(card: self.cards[cardNumber]).stacked(at: cardNumber, in: self.cards.count)
                    }
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
