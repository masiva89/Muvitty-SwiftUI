//
//  Search.swift
//  Muvitty
//
//  Created by gorsentam on 8.07.2023.
//

import Foundation

struct Search : Codable {
    var movies : [SearchedMovie]
    
    private enum CodingKeys : String , CodingKey{
        case movies = "Search"
    }
}
