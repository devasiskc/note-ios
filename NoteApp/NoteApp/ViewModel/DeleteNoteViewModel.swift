//
//  DeleteNoteViewModel.swift
//  NoteApp
//
//  Created by Devasis KC on 29/11/2023.
//

import SwiftUI
import CoreData

class DeleteNoteViewModel: ObservableObject {
    @Published var isDeleteAlertPresented = false
    var noteToDelete: NoteData?
    
   
}
