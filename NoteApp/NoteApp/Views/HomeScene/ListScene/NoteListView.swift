//
//  NoteView.swift
//  NoteApp
//
//  Created by Devasis Kc on 28/11/2023.
//
import SwiftUI

struct NoteListView: View {
    @State private var isPresented = false
    @ObservedObject private var noteViewModel = NotesViewModel()
    @State private var isAddNoteSheetPresented = false
    @State private var selectedNote: NoteData? // Used for editing
    
    var body: some View {
        NavigationView {
            List {
                ForEach(noteViewModel.notes, id: \.self) { note in
                    Text(note.content ?? "")
                        .onTapGesture {
                            selectedNote = note
                            isAddNoteSheetPresented = true
                        }
                        .contextMenu {
                            Button("Delete") {
                                noteViewModel.noteToDelete = note
                                noteViewModel.isDeleteAlertPresented = true
                            }
                        }
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                isAddNoteSheetPresented = true
                isPresented.toggle()
            }) {
                Image(systemName: "plus")
            }
                                
            )
            .navigationBarTitle("Notes")
            
            // Add and Edit Note Sheet
            .sheet(isPresented: $isAddNoteSheetPresented) {
                AddEditNoteView(isPresented: $isAddNoteSheetPresented, noteViewModel: noteViewModel, selectedNote: $selectedNote)
            }
            
            // Delete Note Alert
            .alert(isPresented: $noteViewModel.isDeleteAlertPresented) {
                Alert(
                    title: Text("Confirm Delete"),
                    message: Text("Are you sure you want to delete this note?"),
                    primaryButton: .destructive(Text("Delete")) {
                        noteViewModel.deleteNote()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
