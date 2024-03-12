//
//  BookDetail.swift
//  Assignment3
//
//  Created by Julien on 3/12/24.
//

import SwiftUI

struct BookDetail: View {
    
    var book: BookModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text(book.authors[0].name)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Media Type: \(book.media_type)")
                    .font(.system(size: 10))
                    .padding(.horizontal)
                Text(book.copyright ? "Copyrighted" : "Not copyrighted")
                    .font(.system(size: 10))
                    .padding(.horizontal)
            }
        }
    }
}
