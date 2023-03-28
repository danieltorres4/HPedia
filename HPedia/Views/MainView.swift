//
//  ContentView.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 22/03/23.
//

import SwiftUI

struct MainView: View {
    let characterViewModel = CharacterViewModel()
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person.fill")
                }
            
            SpellsView()
                .tabItem {
                    Label("Spells", systemImage: "wand.and.stars")
                }
        }
        .onAppear {
            Task {
                await characterViewModel.getAllCharacters()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
