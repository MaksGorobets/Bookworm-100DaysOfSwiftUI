//
//  ContentView.swift
//  Bookworm
//
//  Created by Maks Winters on 11.12.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var books: [Book]
    @State private var sheetShown = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        sheetShown.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetShown) {
                AddBookView()
            }
            .navigationTitle("Bookworm")
        }
    }
}

#Preview {
    ContentView()
}
