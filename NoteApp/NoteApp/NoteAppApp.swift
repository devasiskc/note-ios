//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Neela Rai on 28/11/2023.
//

import SwiftUI

@main
struct NoteAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
