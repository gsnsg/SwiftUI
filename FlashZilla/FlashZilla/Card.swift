//
//  Card.swift
//  FlashZilla
//
//  Created by Nikhi on 04/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import Foundation


struct Card {
    let prompt: String
    let answer: String
    
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
