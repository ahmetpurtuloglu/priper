//
//  SearchBarView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @State var isSearching:Bool = false
    
    var body: some View {
        HStack{
            HStack{
                TextField("Hangi kampanyayı arıyorsun ?", text: $searchText)
                    .foregroundColor(Color.text.primary)
                    .padding(.leading,25)
                    .autocorrectionDisabled(true)
            }
            .font(.headline)
            .padding()
            .background(Color.background.primary)
            .cornerRadius(10)
            .padding(15)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.text.primary)
                    
                    Spacer()
                    if !searchText.isEmpty {
                        if isSearching {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            }
                        }
                    }}
                    .padding(.horizontal,30)
                    .foregroundColor(Color.text.primary)
                
            )
            .transition(.move(edge: .trailing))
            .onAppear {
                withAnimation(.easeIn(duration: 0.4)){}
                
            }
            if isSearching {
                ZStack {
                    Button {
                        isSearching = false
                        searchText = ""
                        UIApplication.shared.sendAction( #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    } label: {
                        Text("Cancel")
                            .padding(.trailing)
                            .padding(.leading,0)
                            .foregroundColor(Color.text.primary)
                            .transition(.move(edge: .trailing))
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.4)){}
                                
                            }
                    }
                    
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchBarView(searchText: .constant(""))
        }
        
    }
}

