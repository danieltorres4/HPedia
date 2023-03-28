//
//  Character.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: String
    let name: String
    let house: String?
    let dateOfBirth: String?
    let ancestry: String?
    let wand: Wand?
    let patronus: String?
    let actor: String?
    let image: String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case house
        case dateOfBirth
        case ancestry
        case wand
        case patronus
        case actor
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Character.CodingKeys> = try decoder.container(keyedBy: Character.CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: Character.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: Character.CodingKeys.name)
        self.house = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.house)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.dateOfBirth)
        self.ancestry = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.ancestry)
        self.wand = try container.decodeIfPresent(Wand.self, forKey: Character.CodingKeys.wand)
        self.patronus = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.patronus)
        self.actor = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.actor)
        self.image = try container.decodeIfPresent(String.self, forKey: Character.CodingKeys.image)
        
    }
}
