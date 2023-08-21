//
//  MovieService.swift
//  Muvitty
//
//  Created by gorsentam on 13.07.2023.
//

import Foundation

class MovieService{
    func fetchMovie(
        id: String,
        completion: @escaping (Result<Movie?,ExceptionTypes>)
        ->Void
    )
    {
        let parameter = "i=\(id)"
        let url = URL(string: NetworkConst().BASE_URL + parameter)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let apiData = data, error == nil else {
                return completion(.failure(.noData))
            }
            guard let apiResponse = try? JSONDecoder().decode(Movie.self, from: apiData) else {
                return completion(.failure(.dataProcessError))
            }
            completion(.success(apiResponse))
        }.resume()
    }
        

        
    
}
