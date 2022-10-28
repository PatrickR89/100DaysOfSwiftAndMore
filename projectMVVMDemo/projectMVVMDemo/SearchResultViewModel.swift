//
//  SearchResultViewModel.swift
//  projectMVVMDemo
//
//  Created by Patrick on 16.08.2022..
//

import UIKit

class SearchResultViewModel {

    private var searchResult: SearchResult

    init(searchResult: SearchResult) {
        self.searchResult = searchResult
    }

    var trackName: String {
        searchResult.trackName ?? "- - -"
    }

    var collectionName: String {
        searchResult.collectionName ?? "- - -"
    }
}
