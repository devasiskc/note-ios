//
//  AddEditNoteView.swift
//  NoteApp
//
//  Created by Devasis KC on 29/11/2023.
//
import SwiftUI

struct AddEditNoteView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Binding var isPresented: Bool
    @ObservedObject var noteViewModel: NotesViewModel
    @Binding var selectedNote: NoteData?
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextEditor(text: $content)
                }
                Section {
                    Button("Save") {
                        if let note = selectedNote {
                            // Edit existing note
                            isPresented = false
                            noteViewModel.editNote(note: note, title: title, content: content)
                        } else {
                            // Add new note
                            noteViewModel.addNote(title: title, notes: content)
                            isPresented = false

                        }
                        
                        // Close the sheet
                        selectedNote = nil
                    }
                }
            }
            .navigationTitle(selectedNote != nil ? "Edit Note" : "Add Note")
            .navigationBarItems(trailing: Button("Cancel") {
                            isPresented = false
                        })
        }
        .onAppear {
            // Populate fields if editing an existing note
            if let note = selectedNote {
                title = note.title ?? ""
                content = note.content ?? ""
            }
        }
    }
}
