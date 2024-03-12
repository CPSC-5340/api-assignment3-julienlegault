//
//  BookModel.swift
//  Assignment3
//
//  Created by Julien on 3/12/24.
//

import Foundation

struct BookResults : Codable {
    let count : Int
    let next : String
    let results : [BookModel]
}

struct BookModel : Codable, Identifiable {
    let id : Int
    let title : String
    let authors : [AuthorModel]
    let copyright : Bool
    let media_type : String
}
