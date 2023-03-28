//
//  SpellsViewModel.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 28/03/23.
//

import Foundation

final class SpellsViewModel: ObservableObject {
    @Published var spells: [Spells] = []
    
    func getSpells() async {
        guard let spellsURL = URL(string: "https://hp-api.onrender.com/api/spells") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: spellsURL)
            
            let spellsModel = try! JSONDecoder().decode([Spells].self, from: data)
            
            DispatchQueue.main.async {
                self.spells = spellsModel
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
