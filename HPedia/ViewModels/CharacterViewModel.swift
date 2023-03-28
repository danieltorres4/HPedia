//
//  CharacterViewModel.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import Foundation

final class CharacterViewModel: ObservableObject {
    //@Published var character: CharacterBasicInfo = .empty
    @Published var characters: [Character] = []
    
    func getAllCharacters() async {
        guard let allCharactersURL = URL(string: "https://hp-api.onrender.com/api/characters") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: allCharactersURL)
            
            let characterModel = try! JSONDecoder().decode([Character].self, from: data)
            //print("\n\nCHARACTER MODEL:\n\(characterModel)\n\n")
            print("\n\nCOUNT: \(characterModel.count)")
            
            DispatchQueue.main.async {
                self.characters = characterModel
                //print("\n\nCHARACTER MODEL:\n\(self.characters.description)\n\n")
                print("\n\nCHARACTERS:\n\(self.characters.debugDescription)\n\n")
                print("\n\nCHARACTERS COUNT:\n\(self.characters.count)\n\n")
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
