//
//  DownloadedImageView.swift
//  Muvitty
//
//  Created by gorsentam on 13.07.2023.
//

import SwiftUI

struct DownloadedImageView: View {
    
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String){
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        else{
            return Image("placeholder").resizable()
        }
    }
}

struct DownloadedImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadedImageView(url: "https://timesofindia.indiatimes.com/photo/90908743.cms")
    }
}
