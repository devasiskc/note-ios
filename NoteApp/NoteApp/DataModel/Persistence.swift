//
//  Persistence.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyNotes")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    // A convenient way to access the managed object context
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    // A method to save changes to the Core Data store
    func save() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
