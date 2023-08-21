//
//  SearchedMovie.swift
//  Muvitty
//
//  Created by gorsentam on 8.07.2023.
//

import Foundation

struct SearchedMovie : Codable {
    var title : String?
    var year : String?
    var imdbId : String?
    var type : String?
    var poster : String?
    
    private enum CodingKeys : String , CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}
