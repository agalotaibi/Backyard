//
//  MLGen.swift
//  Backyard
//
//  Created by Amaal on 04/04/1444 AH.
//

import SwiftUI

struct MLGen: View {
    private var subj = ["😂","🥹","🥰","🧐","🎼","😱","🏀","🔎","🤯","🧝🏻‍♀️","🤠","🛸","🧨","🧑🏻‍🦼","⚔️"]
    private var interests = [
        "📷" : Color(.gray),
        "🎬" : Color(.gray),
        "🎨" : Color(.gray),
        "🎼" : Color(.gray),
        "🎮" : Color(.gray),
        "✈️" : Color(.gray),
        "🔭" : Color(.gray),
        "🔬" : Color(.gray),
        "⛺️" : Color(.gray),
        "🪴" : Color(.gray),
        "📖" : Color(.gray),
        "🚲" : Color(.gray),
        "🖋️" : Color(.gray),
        "🎤" : Color(.gray),
        "♟️" : Color(.gray)]
    
    @State private var phase: CGFloat = 0
    @State private var chosenInterest = [String:Color]()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
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
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(interests), id:\.key) { interest in
                            Button {
                                withAnimation {
                                    if chosenInterest.keys.contains(interest.key){
                                        chosenInterest.removeValue(forKey: interest.key)
                                    } else {
                                        chosenInterest[interest.key] = interest.value
                                    }
                                }
                            } label: {
                                if chosenInterest.contains(where: {$0 == interest}) {
                                    Text(interest.key)
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.3)
                                        .frame(width: 90, height: 140)
                                        .padding(.horizontal,8)
                                        .background(interest.value.clipShape(Circle()))
                                        .overlay(
                                            Circle()
                                                .strokeBorder(interest.value ,style: StrokeStyle(lineWidth: 4, dash: [20], dashPhase: phase))
                                                .frame(width: 120, height: 120)
                                                .onAppear {
                                                    withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                                                        phase -= 40
                                                    }
                                                }
                                        )
                                } else {
                                    Text(interest.key)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                        .minimumScaleFactor(0.3)
                                        .frame(width: 60, height: 100)
                                        .padding(.horizontal,8)
                                        .background(interest.value.clipShape(Circle()).brightness(0.4))
                                }
                            }
                            Spacer()
                        }
                    }.padding(.horizontal, 30)
                    
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
