//
//  AddBookView.swift
//  Bookworm
//
//  Created by Maks Winters on 12.12.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter a title", text: $title)
                TextField("Enter an author", text: $author)
                
                Picker("Pick a genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
                Section("Write a review") {
                    RatingView(rating: $rating)
                    TextEditor(text: $review)
                }
                Button("Save") {
                    do {
                        let newBook = try Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    } catch {
                        alertMessage = error.localizedDescription
                        isShowingAlert = true
                    }
                }
            }
            .alert(alertMessage, isPresented: $isShowingAlert) { }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddBookView()
}
