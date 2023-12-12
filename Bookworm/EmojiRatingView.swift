//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Maks Winters on 12.12.2023.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int
    
    var body: some View {
        Text(calculateRating())
    }
    
    func calculateRating() -> String {
        switch rating {
        case 1:
            "😵"
        case 2:
            "😒"
        case 3:
            "😐"
        case 4:
            "🤗"
        default:
            "🤤"
        }
    }
    
}

#Preview {
    EmojiRatingView(rating: 3)
}
