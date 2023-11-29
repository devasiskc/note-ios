//
//  ContentView.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            if notesViewModel.isLoggedIn {
                NoteListView()
            } else {
                LoginView(viewModel: NotesViewModel())
                
            }
        }
    }
}

