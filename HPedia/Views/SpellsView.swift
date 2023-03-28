//
//  SpellsView.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import SwiftUI

struct SpellsView: View {
    @StateObject var spellViewModel = SpellsViewModel()
    @State var spellToSearch: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Reset") {
                    
                }
                .padding()
                .buttonStyle(.bordered)
                
                Form {
                    ForEach(spellViewModel.spells, id: \.id) { spell in
                        HStack {
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                            
                            VStack {
                                Text(spell.name ?? "No name")
                                    .font(.title)
                                    .padding()
                                Text(spell.description ?? "Unknown")
                                    .font(.headline)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Spells ⚡️")
        }
        .searchable(text: $spellToSearch, prompt: Text("Search a spell"))
        .textInputAutocapitalization(.never)
        .onAppear {
            Task {
                await spellViewModel.getSpells()
            }
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
