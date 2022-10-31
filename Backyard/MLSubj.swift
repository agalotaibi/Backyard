//
//  ContentView.swift
//  Backyard
//
//  Created by Amaal on 04/04/1444 AH.
//

import SwiftUI

struct ContentView: View {

    
    private var interests = [
        "🧪" : Color(.gray),
        "🚀" : Color(.gray),
        "🪐" : Color(.gray),
        "🌱" : Color(.gray),
        "🎼" : Color(.gray),
        "🎨" : Color(.gray),
        "🧮" : Color(.gray),
        "🏃🏻" : Color(.gray),
        "🎭" : Color(.gray),
        "🏰" : Color(.gray),
        "🥘" : Color(.gray),
        "🕋" : Color(.gray),
        "🧵" : Color(.gray)]
    
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
        
        NavigationView{
            
            VStack(){
                HStack(){
                    
                    ProgressView("Step 1/4 ", value: 0.2).padding(.trailing)
                    
                    
                    
                    
                }.padding()
                
                VStack(alignment: .leading){
                    Text("Select your Favorite ")
                        .font(.title)
                    Text("Subjects")
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
                VStack{
                    NavigationLink{
                        
                        MLSpport()
                    }
                    
                label:{
                    Text("Next").padding().frame(maxWidth: 180).font(.callout).foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                    
                }
            
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
