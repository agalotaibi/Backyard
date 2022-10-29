//
//  MLGen.swift
//  Backyard
//
//  Created by Amaal on 04/04/1444 AH.
//

import SwiftUI

struct MLGen: View {
    private var subj = ["😂","🥹","🥰","🧐","🎼","😱","🏀","🔎","🤯","🧝🏻‍♀️","🤠","🛸","🧨","🧑🏻‍🦼","⚔️"]
    private let colors:[Color] = [.orange, .green, .blue]
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100))
    
    ]

    var body: some View {
        
        VStack(){
            HStack(){
                
                ProgressView("Step 4/4 ", value: 1).padding(.trailing)
                
               
               
                
            }.padding()
            
            VStack(alignment: .leading){
                Text("Select your Favorite ")
                    .font(.title)
                Text("Shows Genres")
                    .font(.title)
                .fontWeight(.bold).frame(maxWidth: 350, alignment: .leading)
                
                
            }
            
            NavigationView{
                ScrollView{
                    LazyVGrid(columns: adaptiveColumn, spacing: 30){
                        ForEach(subj, id: \.self){ subj in
                            ZStack{
                                
                                Circle().frame(width:100, height:100).foregroundColor(.gray).brightness(0.4)
                                Text("\(subj)")
                                    .font(.system(size: 50))
                            }
                        }
                    }
                }
                
            
                
            }
            
            
            Button("Done") {
                
            }.padding().frame(maxWidth: 180).font(.callout).foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(12)
            
        }
            
        
            
        }
}

struct MLGen_Previews: PreviewProvider {
    static var previews: some View {
        MLGen()
    }
}
