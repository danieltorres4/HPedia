//
//  CharacterModel.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 28/03/23.
//

import Foundation

struct CharacterModel {
    let id: String
    let name: String
    let house: String
    let dateOfBirth: String
    let ancestry: String
    let wand: Wand
    let patronus: String
    let actor: String
    let image: String
    
    static let empty: CharacterModel = .init(id: "No ID", name: "No name", house: "No house", dateOfBirth: "No date of birth", ancestry: "No ancestry", wand: Wand(wood: "No wood", core: "No core", length: 0.0), patronus: "No patronus", actor: "Unknown", image: "No Image")
}
