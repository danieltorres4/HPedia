//
//  Spells.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import Foundation

struct Spells: Decodable {
    let id: String
    let name: String?
    let description: String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Spells.CodingKeys> = try decoder.container(keyedBy: Spells.CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: Spells.CodingKeys.id)
        self.name = try container.decodeIfPresent(String.self, forKey: Spells.CodingKeys.name)
        self.description = try container.decodeIfPresent(String.self, forKey: Spells.CodingKeys.description)
        
    }
}
