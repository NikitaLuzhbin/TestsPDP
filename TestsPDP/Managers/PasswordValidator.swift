//
//  PasswordValidator.swift
//  TestsPDP
//
//  Created by Никита Лужбин on 16.06.2021.
//

import Foundation

class PasswordValidator {

    // MARK: - Type Properties

    static let shared = PasswordValidator()

    // MARK: - Insatnce Methods

    func isValid(text: String) -> Bool {
        return self.isValidLenght(text: text) &&
            self.hasUpperCaseCharacter(text: text) &&
            self.hasUnderscore(text: text)
    }

    // MARK: -

    func hasUpperCaseCharacter(text: String) -> Bool {
        for character in text where character.isUppercase {
            return true
        }

        return false
    }

    func hasUnderscore(text: String) -> Bool {
        for character in text where character == "_" {
            return true
        }

        return false
    }

    func isValidLenght(text: String) -> Bool {
        return text.count > 6 && text.count < 20
    }

    private init() { }
}
