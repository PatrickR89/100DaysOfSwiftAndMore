//
//  MockHTTPClient.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Patrick on 01.02.2023..
//

import Foundation
@testable import YT_Vapor_iOS_App

final class MockHTTPClient: HttpClientProtocol, Mockable {
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJson(filename: "SongResponse", type: T.self)
    }

    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws {
        //
    }

    func delete(at id: UUID, url: URL) async throws {
        //
    }


}
