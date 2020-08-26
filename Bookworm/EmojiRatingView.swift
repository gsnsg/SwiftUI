//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Nikhi on 26/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    
    let ratings: [Int16: String] = [1 : "😴", 2 : "☹️", 3 : "😐", 4 : "😄"]
    var body: some View {
        Text(ratings[rating] ?? "🤩")
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 5)
    }
}
