//
//  CharacterDetailView.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 28/03/23.
//

import SwiftUI

struct CharacterDetailView: View {
    //var character: CharacterModel
    @StateObject var viewModel: CharacterViewModel = CharacterViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
