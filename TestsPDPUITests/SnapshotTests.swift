//
//  SnapshotTests.swift
//  TestsPDPUITests
//
//  Created by Никита Лужбин on 23.11.2021.
//

import XCTest
import SnapshotTesting
@testable import TestsPDP

class SnapshotTests: XCTestCase {
    
    func testLoginViewController() {
        let vc = LoginViewController()

        assertSnapshot(matching: vc, as: .image, record: true)
    }
}
