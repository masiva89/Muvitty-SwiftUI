//
//  MovieRatingModel.swift
//  Muvitty
//
//  Created by gorsentam on 13.07.2023.
//

import Foundation

struct MovieRatingModel : Codable {
    var soruce : String
    var value : String
    
    private enum CodingKeys: String , CodingKey{
        case soruce = "Source"
        case value = "Value"
    }
}
