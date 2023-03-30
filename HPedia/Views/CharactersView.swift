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
                            
                            VStack {
                                Text(character.name)
                                    .fontWidth(.expanded)
                                    .bold()
                                
                                NavigationLink("More info ⚡️") {
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
                                            .font(.system(size: 35).width(.expanded))
                                            .bold()
                                        
                                        Text("Actor: \(character.actor ?? "Unknown")")
                                            .font(.headline.width(.condensed))
                                            .foregroundColor(.gray)
                                        
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(.black)
                                        
                                        Text("Date of birth: \(character.dateOfBirth ?? "Unkown")")
                                            .font(.system(size: 20).width(.condensed))
                                            .padding()
                                        
                                        Text("Wand")
                                            .font(.system(size: 20).width(.condensed))
                                            .padding()
                                            .overlay(alignment: .bottomTrailing) {
                                                Button {
                                                    print("Wand details")
                                                    isPresented = true
                                                } label: {
                                                    HStack {
                                                        Image(systemName: "plus.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .tint(.black)
                                                            .frame(width: 15)
                                                    }
                                                }
                                                .alert(isPresented: $isPresented, content: {
                                                    Alert(title: Text("Wand Info"),
                                                          message: Text("Wood: \(character.wand?.wood ?? "No Wood")\nCore: \(character.wand?.core ?? "No Core")\nLength: \(character.wand?.length ?? 0.0)"),
                                                          primaryButton: Alert.Button.default(Text("Ok")),
                                                          secondaryButton: Alert.Button.destructive(Text("Dismiss")))
                                                })

                                            }
                                        
                                        Text("Ancestry: \(character.ancestry ?? "Unkown")")
                                            .font(.system(size: 20).width(.condensed))
                                        
                                        Text("Patronus: \(character.patronus ?? "Unkown")")
                                            .font(.system(size: 20).width(.condensed))
                                             
                                        Text("House: \(character.house ?? "Unkown")")
                                            .font(.system(size: 20).width(.condensed))
                                    }
                                    .padding(32)
                                }
                                .fontWidth(.compressed)
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
