//
//  SearchService.swift
//  Muvitty
//
//  Created by gorsentam on 8.07.2023.
//

import Foundation

class SearchService{
    func searchMovies(
        searchKey: String,
        completion: @escaping (Result<Search?,ExceptionTypes>)
        ->Void
    )
    {
        let parameter = "s=\(searchKey)"  
        let url = URL(string: NetworkConst().BASE_URL + parameter)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let apiData = data, error == nil else {
                return completion(.failure(.noData))
            }
            guard let apiResponse = try? JSONDecoder().decode(Search.self, from: apiData) else {
                return completion(.failure(.dataProcessError))
            }
            completion(.success(apiResponse))
        }.resume()
    }
        

        
    
}
