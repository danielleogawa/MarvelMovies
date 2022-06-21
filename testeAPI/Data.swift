//
//  Filme.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/19.
//

import Foundation

struct Data: Codable {
    var data: [Filme]
}
struct Filme: Codable {
    var title: String
    var release_date: String?
    var overview: String?
    var cover_url: String?
    var directed_by: String?
    var phase: Int?
    var saga: String?
    var post_credit_scenes: Int?

}
