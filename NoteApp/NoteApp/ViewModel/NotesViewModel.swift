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
    
    public var context = PersistenceController.shared.container.viewContext
    @Published public var notes: [NoteData] = []
    @Published var isNavigationActive = false
    @Published var isDeleteAlertPresented = false
    var noteToDelete: NoteData?
    
    
    init()  {
        fetchNotes()
    }
    
    func fetchNotes()  {
        do {
            notes = try context.fetch(NoteData.fetchRequest())
            notes.reverse()
        } catch {
            print("Error fetching notes: \(error)")
        }
    }
    
    func addNote(title: String, notes: String) {
        do {
            if !notes.isEmpty && !notes.containsWhitespace {
                let newNote = NoteData(context: context)
                newNote.title = title
                newNote.content = notes
                try context.save()
                fetchNotes()
            }
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    func editNote(note: NoteData, title: String, content: String) {
        note.content = content
        
        do {
            try context.save()
            fetchNotes()
        } catch {
            print("Error editing note: \(error)")
        }
    }
    
    func deleteNote() {
        if let note = noteToDelete {
            PersistenceController.shared.viewContext.delete(note)
            PersistenceController.shared.save()
            fetchNotes()
            
        }
        // Reset noteToDelete and hide the alert
        noteToDelete = nil
        isDeleteAlertPresented = false
    }
}

