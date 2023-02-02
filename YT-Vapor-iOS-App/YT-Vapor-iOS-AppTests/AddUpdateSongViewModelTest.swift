//
//  AddUpdateSongViewModelTest.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Patrick on 02.02.2023..
//

import XCTest
@testable import YT_Vapor_iOS_App

class AddUpdateSongViewModelTest: XCTestCase {

    var addUpdateSongVM: AddUpdateSongViewModel?

    override func setUp() {
        super.setUp()
        addUpdateSongVM = AddUpdateSongViewModel(MockHTTPClient())
    }

    override func tearDown() {
        super.tearDown()
        addUpdateSongVM = nil

    }

    func testNoEmptyName() {
        guard let addUpdateSongVM = addUpdateSongVM else {
            fatalError()
        }

        addUpdateSongVM.songTitle = "Something"

        XCTAssertTrue(addUpdateSongVM.isValidSong(), "Song name must be valid!")
    }

    func testFailOnWhitespaceSongName() {
        guard let addUpdateSongVM = addUpdateSongVM else {
            fatalError()
        }

        addUpdateSongVM.songTitle = "       "

        XCTAssertFalse(addUpdateSongVM.isValidSong(), "Song name should not be valid")
    }
}
