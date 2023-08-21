//
//  ImageDownloader.swift
//  Muvitty
//
//  Created by gorsentam on 13.07.2023.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var downloadedImage : Data?
    
    func downloadImage(url : String){
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, response, error in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
            
            
        }.resume()
    }
}
