//
//  LoginViewModel.swift
//  NoteApp
//
//  Created by Devasis KC on 29/11/2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @Published var showAlert = false


    //dummy users mock data...
    private let users: [User] = [
        User(username: "john01", password: "AB01@1", status: "false"),
        User(username: "mike_", password: "20Mike", status: "true"),
        User(username: "nikita", password: "ZoPW_98", status: "false"),
        User(username: "test", password: "test2@", status: "true")
    ]
    
    
    func login(username: String, password: String) {
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            if user.status.lowercased() == "true" {
                isLoggedIn = true
                showAlert = true
            }
        }
    }
    
    func logout() {
        isLoggedIn = false
    }
    
}
