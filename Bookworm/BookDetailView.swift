//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Maks Winters on 13.12.2023.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let book: Book
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre)
                    .foregroundStyle(.white)
                    .font(.system(size: 40))
                    .padding()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width
                    }
                    .background(.ultraThinMaterial.opacity(0.9))
            }
            Text(book.author)
                .padding()
                .font(.title)
            Divider()
            Text("Review:")
            Text(book.review)
            Divider()
            RatingView(rating: .constant(book.rating))
                .font(.system(size: 30))
                .padding()
            Divider()
            Text(book.formattedDate)
                .padding()
                .foregroundStyle(.secondary)
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                isShowingAlert.toggle()
            }
        }
        .alert("Are you sure?", isPresented: $isShowingAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) { deleteCurrent() }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func deleteCurrent() {
        modelContext.delete(book)
        dismiss()
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let book = try! Book(title: "Example Book", author: "Example Author", genre: "Fantasy", review: "This is such a great book", rating: 4)
        return BookDetailView(book: book)
            .modelContainer(container)
    } catch {
        return Text(error.localizedDescription)
    }
}
