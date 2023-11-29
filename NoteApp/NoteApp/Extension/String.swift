//
//  String.swift
//  NoteApp
//
//  Created by Devasis KC on 29/11/2023.
//

import Foundation

extension String {
    var containsWhitespace: Bool {
        let whitespaceCharacterSet = CharacterSet.whitespacesAndNewlines
        return self.rangeOfCharacter(from: whitespaceCharacterSet) != nil
    }
}
