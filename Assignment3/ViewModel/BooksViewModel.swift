//
//  BooksViewModel.swift
//  Assignment3
//
//  Created by Julien on 3/12/24.
//

import Foundation

class BooksViewModel : ObservableObject {
    
    @Published private(set) var bookData = [BookModel]()
    @Published var hasError = false
    @Published var error : BookModelError?
    private let url = "https://gutendex.com/books"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(BookResults?.self, from: data) else {
                    print(error)
                    self.hasError.toggle()
                    self.error = BookModelError.decodeError
                    return
                }
                self.bookData = results.results
            } catch {
                print(error)
                self.hasError.toggle()
                self.error = BookModelError.customError(error: error)
            }
        }
    }
    
}

extension BooksViewModel {
    enum BookModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
