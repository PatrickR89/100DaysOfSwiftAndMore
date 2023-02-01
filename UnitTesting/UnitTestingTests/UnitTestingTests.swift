//
//  UnitTestingTests.swift
//  UnitTestingTests
//
//  Created by Patrick on 01.02.2023..
//

import XCTest
@testable import UnitTesting

class UnitTestingTests: XCTestCase {

    var simpleMath: SimpleMath!

    override func setUp() {
        simpleMath = SimpleMath()
    }

    override func tearDown() {
        simpleMath = nil
    }

    func testAddTenWorks() {
        // Given - Arrange
        var expected: Int = 0

        // When - Act
        expected = simpleMath.addTen(10)

        // Then - Assert
        XCTAssert(expected == 20, "This should be 20")
        XCTAssertTrue(expected == 20)
        XCTAssertEqual(expected, 20, "This should be 20")

    }

    func testBeSquareSucceeds() {
        var expected: Int = 0

        expected = simpleMath.beSquare(4)

        XCTAssertEqual(expected, 16)
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
