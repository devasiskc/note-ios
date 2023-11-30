//
//  LoginView.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var loginViewModel: LoginViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isValidationAlertPresented = false
    @State private var isFormValid = true
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isNavigationActive = false
    
    init(viewModel: LoginViewModel) {
        self.loginViewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Label("Welcome to your Notes", systemImage: "heart.fill")
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            
            Button("Login") {
                // Perform empty validation
                if !username.isEmpty && !password.isEmpty {
                    isFormValid = true
                    showAlert.toggle()
                    loginViewModel.login(username: username, password: password)
                    
                } else {
                    isFormValid = false
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isFormValid ? Color.blue : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
            
            // Optionally, you can display an error message
            if !isFormValid {
                Text("Please enter both username and password.")
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
            
        }
        .padding()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
