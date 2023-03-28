//
//  CharacterViewModel.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import Foundation

final class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func getAllCharacters() async {
        guard let allCharactersURL = URL(string: "https://hp-api.onrender.com/api/characters") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: allCharactersURL)
            
            let characterModel = try! JSONDecoder().decode([Character].self, from: data)
            
            DispatchQueue.main.async {
                self.characters = characterModel
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
