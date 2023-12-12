//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Maks Winters on 11.12.2023.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
