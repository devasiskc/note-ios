//
//  NotesViewModelTests.swift
//  NoteAppTests
//
//  Created by Devasis KC on 29/11/2023.
//

import XCTest
import CoreData
@testable import NoteApp

class NotesViewModelTests: XCTestCase {
    
    var viewModel: NotesViewModel!
    var mockPersistenceController: PersistenceController!
    
    @MainActor override func setUpWithError() throws {
        mockPersistenceController = PersistenceController()
        viewModel = NotesViewModel()
        viewModel.context = mockPersistenceController.container.viewContext
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockPersistenceController = nil
    }
    
    @MainActor func testAddNote() {
        // Given
        let initialNoteCount = viewModel.notes.count
        let title = "Test Note"
        let content = "This is a test note"
        
        // When
        viewModel.addNote(title: title, notes: content)
        
        // Then
        XCTAssertEqual(viewModel.notes.count, initialNoteCount + 1)
        XCTAssertTrue(viewModel.notes.contains(where: { $0.title == title && $0.content == content }))
    }
    
    @MainActor func testEditNote() {
        // Given
        let note = NoteData(context: mockPersistenceController.container.viewContext)
        note.title = "Old Title"
        note.content = "Old Content"
        viewModel.fetchNotes() // Refresh notes after adding a dummy note
        
        // When
        viewModel.editNote(note: note, title: "New Title", content: "New Content")
        
        // Then
        XCTAssertEqual(note.title, "New Title")
        XCTAssertEqual(note.content, "New Content")
    }
    
    @MainActor func testDeleteNote() {
        // Given
        let note = NoteData(context: mockPersistenceController.container.viewContext)
        viewModel.fetchNotes() // Refresh notes after adding a dummy note
        
        // When
        viewModel.noteToDelete = note
        viewModel.deleteNote()
        
        // Then
        XCTAssertEqual(viewModel.notes.count, 0)
        XCTAssertFalse(viewModel.notes.contains(note))
    }
    
    // Add more test cases as needed
}

