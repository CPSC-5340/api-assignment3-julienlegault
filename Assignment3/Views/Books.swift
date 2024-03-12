//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct Books: View {
    @ObservedObject var booksvm = BooksViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(booksvm.bookData) { book in
                    NavigationLink {
                        BookDetail(book: book)
                    } label: {
                        Text(book.title)
                    }
                }
            }
            .task {
                await booksvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Books")
            .alert(isPresented: $booksvm.hasError, error: booksvm.error) {
                Text("Ok")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Books()
    }
}
