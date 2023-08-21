//
//  MovieView.swift
//  Muvitty
//
//  Created by gorsentam on 14.07.2023.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var movieViewModel : MovieViewModel
    
    var id : String
    
    static let gradientStart = Color.black
    static let gradientEnd = Color.black.opacity(0.2)

    
    init(id: String) {
        movieViewModel = MovieViewModel()
        self.id = id
        movieViewModel.fetchSearchedMovies(id: self.id)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .bottomLeading){
                DownloadedImageView(url: movieViewModel.movieModel?.poster ?? "")
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.width * 0.8)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                    .shadow(radius: 40)
                Rectangle()
                    .fill(LinearGradient(
                      gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                      startPoint: .bottom,
                      endPoint: .top
                    ))
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.width * 0.8)
                    .edgesIgnoringSafeArea(.top)
                VStack(alignment: .leading){
                    Text(movieViewModel.movieModel?.title ?? "")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    HStack{
                        Text(movieViewModel.movieModel?.released ?? "")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Text("|")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(EdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 5))
                        Text(movieViewModel.movieModel?.runtime ?? "")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 20))
                    }
                    ZStack{
//                        Rectangle()
//                            .fill(Color.yellow)
//                            .fixedSize(horizontal: true, vertical: true)
//                            .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                        Text("IMDB: \(movieViewModel.movieModel?.imdbRating ?? "")")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .background(Color.yellow)
                            .cornerRadius(8)
                            .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                            .shadow(color: .yellow,radius: 5)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.width * 0.8)
            .padding(.zero)
            .edgesIgnoringSafeArea(.top)
            
            Group{
                Text(movieViewModel.movieModel?.plot ?? "")
                    .foregroundColor(.white)
                    .font(.body)
                    .fontWeight(.light)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
            .background(Color.indigo)
            .offset(x: 0,y: -UIScreen.main.bounds.height * 0.065)
            .shadow(radius: 20)
            
            VStack{
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        Text("Director:")
                            .font(Font.body)
                            .fontWeight(.light)
                        Text(movieViewModel.movieModel?.director ?? "")
                            .font(Font.body)
                            .fontWeight(.bold)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    HStack(alignment: .top){
                        Text("Actors:")
                            .font(Font.body)
                            .fontWeight(.light)
                        Text(movieViewModel.movieModel?.actors ?? "")
                            .font(Font.body)
                            .fontWeight(.bold)
                    }
                }.padding()
            }
            .offset(x: 0,y: -UIScreen.main.bounds.height * 0.07)
            Spacer()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(id: "tt0098019")
    }
}
