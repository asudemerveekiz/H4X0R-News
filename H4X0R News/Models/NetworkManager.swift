//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Asude Merve Ekiz on 10.10.2022.

//In practical terms, whenever an object with a property marked @Published is changed,
//all views using that object will be reloaded to reflect those changes.

//check this website to read more about @Published, Observableobject and ObservedObject
//www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper

import Foundation
class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()
        
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits //this post property is a property that other objects are listening to
                                //so this update for it must be in a main thread. Because of it we put this in a DispatchQueue.
                            }
                           
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume() //for start our network task.
        }
    }
}
