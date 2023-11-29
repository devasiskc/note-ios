//
//  NoteView.swift
//  NoteApp
//
//  Created by Neela Rai on 28/11/2023.
//
import SwiftUI

struct NoteListView: View {
    @ObservedObject private var noteViewModel = NotesViewModel()
    @State private var isAddNoteSheetPresented = false
    @State private var selectedNote: NoteData? // Used for editing
    @StateObject private var deleteNoteViewModel = DeleteNoteViewModel()
    
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
                                deleteNoteViewModel.noteToDelete = note
                                deleteNoteViewModel.isDeleteAlertPresented = true
                            }
                        }
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                isAddNoteSheetPresented = true
            }) {
                Image(systemName: "plus")
            }
            )
            .navigationBarTitle("Notes")
            
            // Add and Edit Note Sheet
            .sheet(isPresented: $isAddNoteSheetPresented) {
                AddEditNoteView(noteViewModel: noteViewModel, selectedNote: $selectedNote)
            }
            
            // Delete Note Alert
            .alert(isPresented: $deleteNoteViewModel.isDeleteAlertPresented) {
                Alert(
                    title: Text("Confirm Delete"),
                    message: Text("Are you sure you want to delete this note?"),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteNoteViewModel.deleteNote()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
