//
//  SearchViewModel.swift
//  Muvitty
//
//  Created by gorsentam on 10.07.2023.
//

import Foundation
import SwiftUI

class SearchViewModel : ObservableObject {
    
    let searchService = SearchService()
    
    @Published var searchModel : Search?
    
    func fetchSearchedMovies(searchKey : String) {
        searchService.searchMovies(searchKey: searchKey) { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let response):
                    if let response = response {
                        DispatchQueue.main.async {
                            self.searchModel = response
                        }
                    }
            }
        }
    }
}
