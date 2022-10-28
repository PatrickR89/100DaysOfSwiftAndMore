//
//  ViewModel.swift
//  projectMVVMDemo
//
//  Created by Patrick on 16.08.2022..
//

import UIKit

class ViewModel {

    let results: Binder<[SearchResult]> = Binder([])
    let error: Binder<String?> = Binder(nil)
    let isButtonEnabled: Binder<Bool> = Binder(false)
    let isLoadingEnabled: Binder<Bool> = Binder(false)

    var searchText: String? = nil {
        didSet {isButtonEnabled.value = getEnabledFlowStatus()}
    }

    func performSearch() {

        guard let gSearchText = searchText else {return}
        let search = gSearchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        guard let gUrl = URL(string: "https://itunes.apple.com/search?term=\(search)") else {return}

        isLoadingEnabled.value = true
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                isLoadingEnabled.value = false
                results.value = response.results ?? []
            } catch {
                isLoadingEnabled.value = false
                self.error.value = "*** ERROR ***"
            }
        }
    }

    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let itm = results.value[index]
        return SearchResultViewModel(searchResult: itm)
    }
}

private extension ViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else {return false}
        return gSearchText.count >= 3
    }
}
