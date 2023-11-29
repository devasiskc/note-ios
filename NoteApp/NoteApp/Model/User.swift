//
//  User.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var username: String
    var password: String
    var status: String
}
