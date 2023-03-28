//
//  SpellsView.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import SwiftUI

struct SpellsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Spells View")
            }
            .padding()
            .navigationTitle("Spells ⚡️")
        }
    }
}

struct SpellsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsView()
    }
}
