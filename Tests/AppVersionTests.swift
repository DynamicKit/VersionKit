//
//  VersionKitTests.swift
//  VersionKitTests
//
//  Created by Mohammad reza Koohkan on 4/10/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import XCTest
@testable import VersionKit

class VersionKitTests: XCTestCase {
    
    var sut:  AppVersion!
    let current = "2.7.8"
    let higher = "2.7.9"
    let higherMinorLowerPatch = "2.8.7"
    let higherMajorLowerMinor = "3.6.9"
    let lower = "2.7.7"
    let lowerMinorHigherPatch = "2.6.10"
    let lowerMajorHigherMinor = "1.8.9"
    let invalidVersionPart = "1.21"
    let invalidVersionIntegar = "10.2.x"

    
    override func setUp() {
        super.setUp()
        self.sut = AppVersion(version: self.current)
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
    func testInvalidAppVersion() {
        XCTAssertNil(AppVersion(version: invalidVersionPart))
        XCTAssertNil(AppVersion(version: invalidVersionIntegar))
    }
    
    func testIsLowerThanHigherVersion() {
        let result = self.sut.isLower(thanVersion: higher)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotLowerThanLowerVersion() {
        let result = self.sut.isLower(thanVersion: lower)
        XCTAssertEqual(result, false)
    }
    
    func testIsNotLowerThanEqualVersion() {
        let result = self.sut.isLower(thanVersion: current)
        XCTAssertEqual(result, false)
    }
    
    func testIsHigherThanLowerVersionSuccess() {
        let result = self.sut.isHigher(thanVersion: lower)
        let resultLowerMinorHigherPatch = self.sut.isHigher(thanVersion: lowerMinorHigherPatch)
        let resultLowerMajorHigherMinor = self.sut.isHigher(thanVersion: lowerMajorHigherMinor)
        XCTAssertTrue(result)
        XCTAssertTrue(resultLowerMinorHigherPatch)
        XCTAssertTrue(resultLowerMajorHigherMinor)
    }
    
    func testIsHigherThanLowerVersionFailure() {
        let resultHigherMinorLowerPatch = self.sut.isHigher(thanVersion: higherMinorLowerPatch)
        let resultHigherMajorLowerMinor = self.sut.isHigher(thanVersion: higherMajorLowerMinor)
        XCTAssertFalse(resultHigherMinorLowerPatch)
        XCTAssertFalse(resultHigherMajorLowerMinor)
    }
    
    func testIsNotHigherThanHigherVersion() {
        let result = self.sut.isHigher(thanVersion: higher)
        XCTAssertEqual(result, false)
    }
    
    func testIsNotHigherThanEqualVersion() {
        let result = self.sut.isHigher(thanVersion: current)
        XCTAssertEqual(result, false)
    }
    
    func testIsEqual() {
        let result = self.sut.isEqual(to: current)
        XCTAssertEqual(result, true)
    }
}
