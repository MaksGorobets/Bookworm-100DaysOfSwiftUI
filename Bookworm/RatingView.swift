//
//  RatingView.swift
//  Bookworm
//
//  Created by Maks Winters on 12.12.2023.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var maximumRating: Int = 5
    @State var offColor: Color = .yellow
    @State var onColor: Color = .orange
    
    var filledImage: String = "star.fill"
    var image: String = "star"
    
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
        if rating != 1 {
            if number >= rating {
                return (image, offColor)
            } else {
                return (filledImage, onColor)
            }
        } else {
            if number >= rating {
                return (image, .pink)
            } else {
                return (filledImage, .red)
            }
        }
    }
    
}

#Preview {
    RatingView(rating: .constant(3))
}
