//
//  TestsPDPTests.swift
//  TestsPDPTests
//
//  Created by Никита Лужбин on 16.06.2021.
//

import XCTest
@testable import TestsPDP

class TestsPDPTests: XCTestCase {

    var passwordValidator: PasswordValidator!

    override func setUpWithError() throws {
        self.passwordValidator = PasswordValidator.shared
    }

    override func tearDownWithError() throws {
        self.passwordValidator = nil
    }

    func testPasswordLenghtValidation() throws {

        func createString(length: Int) -> String {
            var string = ""

            guard length != 0 else {
                return string
            }

            for _ in 1...length {
                string.append("a")
            }

            return string
        }

        let smallPassword = createString(length: 1)
        let bigPassword = createString(length: 50)
        let normalPassword = createString(length: 10)

        let upperBorderlineCase = createString(length: 20)
        let bottomBorderlineCase = createString(length: 6)
        let emptyStringCase = createString(length: 0)
        let hugeStringCase = createString(length: 200)

        XCTAssertFalse(self.passwordValidator.isValidLenght(text: smallPassword))
        XCTAssertFalse(self.passwordValidator.isValidLenght(text: bigPassword))
        XCTAssertTrue(self.passwordValidator.isValidLenght(text: normalPassword))
        XCTAssertFalse(self.passwordValidator.isValidLenght(text: bottomBorderlineCase))
        XCTAssertFalse(self.passwordValidator.isValidLenght(text: upperBorderlineCase))
        XCTAssertFalse(self.passwordValidator.isValidLenght(text: hugeStringCase))
        XCTAssertFalse(self.passwordValidator.isValidLenght(text: emptyStringCase))
    }

    func testPasswordHasUnderscoreValidation() throws {
        let underscoreInBeginning = "_qweqwe"
        let underscoreInEnding = "qweqwe_"
        let underscoreInMiddle = "qwe_qwe"
        let noUnderscore = "qweqwe"

        XCTAssertTrue(self.passwordValidator.hasUnderscore(text: underscoreInBeginning))
        XCTAssertTrue(self.passwordValidator.hasUnderscore(text: underscoreInEnding))
        XCTAssertTrue(self.passwordValidator.hasUnderscore(text: underscoreInMiddle))
        XCTAssertFalse(self.passwordValidator.hasUnderscore(text: noUnderscore))
    }

    func testPasswordHasUppercaseValidation() throws {
        let uppercaseInBeginning = "Aqweqwe"
        let uppercaseInEnding = "qweqweA"
        let uppercaseInMiddle = "qweAqwe"
        let noUppercase = "qweqwe"

        XCTAssertTrue(self.passwordValidator.hasUpperCaseCharacter(text: uppercaseInBeginning))
        XCTAssertTrue(self.passwordValidator.hasUpperCaseCharacter(text: uppercaseInEnding))
        XCTAssertTrue(self.passwordValidator.hasUpperCaseCharacter(text: uppercaseInMiddle))
        XCTAssertFalse(self.passwordValidator.hasUpperCaseCharacter(text: noUppercase))
    }
}
