//
//  SearchView.swift
//  Muvitty
//
//  Created by gorsentam on 10.07.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel : SearchViewModel
    
    @State var searchKey = ""
    
    init() {
        self.searchViewModel = SearchViewModel()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                    TextField("Film ismi, yılı, aktör ismi, yönetmen",text: $searchKey)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                        .background(Color.indigo.opacity(0.1))
                        .cornerRadius(12)
                        .padding(.all)
                        .onSubmit {
                            self.searchViewModel.fetchSearchedMovies(searchKey: searchKey.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchKey)
                        }
                
                    
                    
                List(searchViewModel.searchModel?.movies ?? [],id: \.imdbId) { movie in
                    NavigationLink(
                        destination: MovieView(id: movie.imdbId!),
                        label: {
                            HStack{
                                DownloadedImageView(url: movie.poster!)
                                    .frame(width: 90,height: 120)
                                    .cornerRadius(12)
                                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 15))
                                
                                VStack(alignment: .leading){
                                    Text(movie.title ?? "")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.indigo)
                                    Text(movie.year ?? "")
                                        .font(.subheadline)
                                    
                                }
                            }
                        }
                    )
                    
                }
            }.navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
