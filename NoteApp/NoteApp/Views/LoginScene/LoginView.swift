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
                
                HStack {
                    Button("Login") {
                    loginViewModel.login(username: username, password: password)
                       
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Login Status"),
                            message: Text(alertMessage),
                            dismissButton: .default(Text("Okay")) {
                                if alertMessage == "Login Successful" {
                                    // Navigate to the "Notes" screen
                                    // You may want to handle navigation here
                                    print("Navigating to Notes screen...")
                                }
                            }
                        )
                    }
                
                Spacer()
            }
        .padding()
    }
    
    private func login() {
        // Perform actual login logic (validate username and password)
        let isValid = validateLogin()
        
        // Show alert based on login status
        showAlert = true
        alertMessage = isValid ? "Login Successful" : "Login Failed"
    }
    
    private func validateLogin() -> Bool {
        // Replace this logic with your actual validation
        return username == "$username" && password == "$password"
    }
    func isInputValid() -> Bool {
        // Perform your validation logic here
        return !username.isEmpty && !password.isEmpty
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
