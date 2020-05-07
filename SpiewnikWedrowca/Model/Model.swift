//
//  Model.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 06/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct Song : Codable, Hashable {
    let number: Int
    let title: String
    let lyrics: String
    
    enum CodingKeys: String, CodingKey {
        case number = "number"
        case title = "title"
        case lyrics = "lyrics"
    }
    
    init(number: Int, title: String, lyrics: String) {
        self.number = number
        self.title = title
        self.lyrics = lyrics
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(Int.self, forKey: .number)!
        title = try values.decodeIfPresent(String.self, forKey: .title)!
        lyrics = try values.decodeIfPresent(String.self, forKey: .lyrics)!
    }
    
}
