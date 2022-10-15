//
//  PostData.swift
//  H4X0R News
//
//  Created by Asude Merve Ekiz on 10.10.2022.
//

import Foundation
struct Results:Decodable {
    let hits: [Post]
}



struct Post:Decodable,Identifiable{
    
    var id:String{ //it is computed property
        return objectID
    }
    let objectID:String
    
    let points :Int
    let title:String
    let url:String?
}
