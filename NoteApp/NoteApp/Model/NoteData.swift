//
//  Note.swift
//  NoteApp
//
//  Created by Devasis KC on 28/11/2023.
//

import CoreData

@objc(NoteData)
public class NoteData: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var id: UUID = UUID()
}
