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
            NoteListView(loginViewModel: self.loginViewModel)
                .alert(isPresented: $loginViewModel.showAlert) {
                    Alert(title: Text("Success"), message: Text("Login Successful"), dismissButton: .default(Text("Got it!")))
                }
        } else {
            LoginView(viewModel: self.loginViewModel)
            
        }
    }
}

