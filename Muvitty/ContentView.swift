//
//  ContentView.swift
//  Muvitty
//
//  Created by gorsentam on 8.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(
                action: {
                    print("button tapped")
                    
            },
                label: {
                    Text("Fetch movies")
                }
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
