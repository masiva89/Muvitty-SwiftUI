//
//  Movie.swift
//  Muvitty
//
//  Created by gorsentam on 8.07.2023.
//

import Foundation

struct Movie : Codable {
    var title : String?
    var year : String?
    var rated : String?
    var type : String?
    var poster : String?
    var released : String?
    var runtime : String?
    var genre : String?
    var director : String?
    var writer : String?
    var actors : String?
    var plot : String?
    var language : String?
    var awards : String?
    var ratings : [MovieRatingModel]
    var metascore : String?
    var imdbRating : String?
    var imdbVotes : String?
    var imdbId : String?
    var dvd : String?
    var boxOffice : String?
    var production : String?
    var website : String?
    
    private enum CodingKeys : String , CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case awards = "Awards"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        
    }
    
}
