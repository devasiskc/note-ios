//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import SwiftUI

@main
struct NoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
