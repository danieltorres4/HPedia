//
//  CharacterModelMapper.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 28/03/23.
//

import Foundation

struct CharacterModelMapper {
    func mapResponseDataModelToModel(dataModel: Character) -> CharacterModel {
        
        return CharacterModel(id: dataModel.id, name: dataModel.name, house: dataModel.house ?? "Unknown", dateOfBirth: dataModel.dateOfBirth ?? "Unknown", ancestry: dataModel.ancestry ?? "Unknown", wand: Wand(wood: dataModel.wand?.wood, core: dataModel.wand?.core, length: dataModel.wand?.length), patronus: dataModel.patronus ?? "Unknown", actor: dataModel.actor ?? "Unknown", image: dataModel.image ?? "No Image")
    }
}
