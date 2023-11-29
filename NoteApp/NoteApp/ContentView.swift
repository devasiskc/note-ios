//
//  ContentView.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
            if loginViewModel.isLoggedIn {
                NoteListView()
            } else {
                LoginView(viewModel: self.loginViewModel)
                
            }
    }
}

