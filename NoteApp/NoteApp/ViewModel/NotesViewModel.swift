//
//  NotesViewModel.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import Foundation
import CoreData
import SwiftUI

@MainActor
class NotesViewModel: ObservableObject {
    
    private let context = PersistenceController.shared.container.viewContext
    @Published public var notes: [NoteData] = []
    @Published var isLoggedIn: Bool = false
    private let users: [User] = [
        User(username: "john01", password: "AB01@1", status: "false"),
        User(username: "mike_", password: "20Mike", status: "true"),
        User(username: "nikita", password: "ZoPW_98", status: "false"),
        User(username: "test", password: "test2@", status: "true")
    ]
    
    init()  {
        fetchNotes()
    }
    
    //MARK: Login async function
    func login(username: String, password: String) {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            if user.status.lowercased() == "true" {
                isLoggedIn = true
            }
        }
    }
    
    func fetchNotes()  {
        do {
            notes = try context.fetch(NoteData.fetchRequest())
        } catch {
            print("Error fetching notes: \(error)")
        }
    }
    
    func addNote(title: String, notes: String) {
        let newNote = NoteData(context: context)
        newNote.title = title
        newNote.content = notes
        
        do {
            try context.save()
            fetchNotes()
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    func editNote(note: NoteData, title: String, content: String) {
        note.title = title
        note.content = content
        
        do {
            try  context.save()
            fetchNotes()
        } catch {
            print("Error editing note: \(error)")
        }
    }
    
    func getAllNotes() -> [NoteData] {
        return notes
    }
    
}

