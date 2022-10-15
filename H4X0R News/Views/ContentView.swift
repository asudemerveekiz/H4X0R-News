//
//  ContentView.swift
//  H4X0R News
//
//  Created by Asude Merve Ekiz on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            
            List(networkManager.posts){post in
                NavigationLink(destination: DetailView(url: post.url)){ //the following  components are clickable and when the user clicks on it it will navigate them to the DetailView. Thus they can read the news' details.
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            }
            
            .navigationBarTitle("H4X0R News")
        }
        
        
        .onAppear{ //it's like viewDidLoad
            self.networkManager.fetchData()
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



