//
//  SongListViewModelTest.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Patrick on 02.02.2023..
//

import Combine
import XCTest
@testable import YT_Vapor_iOS_App

class SongListViewModelTest: XCTestCase {

    var songListVM: SongListViewModel?
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        songListVM = SongListViewModel(MockHTTPClient())
    }

    override func tearDown() {
        super.tearDown()
        songListVM = nil
        cancellables.removeAll()
    }

    func testFetchSongsSuccesfully() async throws {

        let expectation = XCTestExpectation(description: "Fetched Songs")

        try await songListVM?.fetchSongs()

        songListVM!
            .$songs
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value.count, 2)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1)

    }
}
