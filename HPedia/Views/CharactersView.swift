//
//  CharactersView.swift
//  HPedia
//
//  Created by Iván Sánchez Torres on 23/03/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var characterViewModel = CharacterViewModel()
    @State var characterToSearch: String = ""
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Reset") {
                    
                }
                .padding()
                .buttonStyle(.bordered)
                
                Form {
                    ForEach(characterViewModel.characters, id: \.id) { character in
                        HStack {
                            AsyncImage(url: URL(string: character.image!)) { image in
                                image
                                    .resizable()
                                    .frame(width: 140, height: 180)
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            
                            NavigationLink(character.name) {
                                VStack {
                                    AsyncImage(url: URL(string: character.image!)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 200, height: 240)
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Text(character.name)
                                        .font(.largeTitle)
                                        .bold()
                                        .padding()
                                    
                                    Text("Date of birth: \(character.dateOfBirth ?? "Unkown")")
                                        .padding()
                                    
                                    Button("Wand") {
                                        isPresented = true
                                    }
                                        .alert(isPresented: $isPresented, content: {
                                            Alert(title: Text("Wand Info"),
                                                  message: Text("Wood: \(character.wand?.wood ?? "No Wood")\nCore: \(character.wand?.core ?? "No Core")\nLength: \(character.wand?.length ?? 0.0)"),
                                                  primaryButton: Alert.Button.default(Text("Ok")),
                                                  secondaryButton: Alert.Button.destructive(Text("Dismiss")))
                                        })
                                        .padding()
                                    
                                    Text("Ancestry: \(character.ancestry ?? "Unkown")")
                                    
                                    Text("Patronus: \(character.patronus ?? "Unkown")")
                                         
                                    Text("House: \(character.house ?? "Unkown")")
                                        .padding(.bottom)
                                    
                                    Text("Actor: \(character.actor ?? "Unknown")")
                                        .font(.headline)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("All Characters ⚡️")
        }
        .searchable(text: $characterToSearch, prompt: Text("Search a character"))
        .textInputAutocapitalization(.never)
        .onAppear {
            Task {
                await characterViewModel.getAllCharacters()
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
