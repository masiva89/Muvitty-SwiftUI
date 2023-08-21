//
//  MovieViewModel.swift
//  Muvitty
//
//  Created by gorsentam on 14.07.2023.
//

import Foundation
import SwiftUI

class MovieViewModel : ObservableObject {
    
    let movieService = MovieService()
    
    @Published var movieModel : Movie?
    
    func fetchSearchedMovies(id : String) {
        movieService.fetchMovie(id: id) { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let response):
                    if let response = response {
                        DispatchQueue.main.async {
                            self.movieModel = response
                        }
                    }
            }
        }
    }
}

