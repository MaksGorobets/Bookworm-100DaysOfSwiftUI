//
//  Book.swift
//  Bookworm
//
//  Created by Maks Winters on 12.12.2023.
//

import Foundation
import SwiftData

extension ErrorChecker: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyTitle:
            return NSLocalizedString(
                "The title is empty.",
                comment: ""
            )
        case .emptyAuthor:
            return NSLocalizedString(
                "The author is empty",
                comment: ""
            )
        }
    }
}

enum ErrorChecker: String, Error {
    case emptyTitle = "The title is empty"
    case emptyAuthor = "The author is empty"
}

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    let date = Date()
    
    var formattedDate: String {
        var formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        return formatter.string(from: date)
    }
    
    init(title: String, author: String, genre: String, review: String, rating: Int) throws {
        guard title != "" else { throw ErrorChecker.emptyTitle }
        guard author != "" else { throw ErrorChecker.emptyAuthor }
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
    
}
