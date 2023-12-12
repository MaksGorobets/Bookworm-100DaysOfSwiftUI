//
//  RatingView.swift
//  Bookworm
//
//  Created by Maks Winters on 12.12.2023.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    let maximumRating: Int = 5
    let offColor: Color = .yellow
    let onColor: Color = .orange
    
    let filledImage: String = "star.fill"
    let image: String = "star"
    
    var body: some View {
        HStack {
            ForEach(0..<maximumRating, id: \.self) { number in
                    Button {
                        withAnimation {
                            rating = number + 1
                        }
                    } label: {
                        Image(systemName: params(number: number).0)
                            .foregroundStyle(params(number: number).1)
                    }
            }
        }
        .buttonStyle(.plain)
    }
    
    func params(number: Int) -> (String, Color) {
        if number >= rating {
            return (image, offColor)
        } else {
            return (filledImage, onColor)
        }
    }
    
}

#Preview {
    RatingView(rating: .constant(3))
}
