//
//  DetailView.swift
//  H4X0R News
//
//  Created by Asude Merve Ekiz on 14.10.2022.
//

import SwiftUI


struct DetailView: View {
    let url:String?
    
    var body: some View {
       WebView(urlString: url)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(url: "https://apple.com")
    }
}



