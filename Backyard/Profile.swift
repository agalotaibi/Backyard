//
//  Profile.swift
//  Backyard
//
//  Created by Amaal on 05/04/1444 AH.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            HStack{
                Image("profileIm").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 180).clipShape(Circle())
                    .shadow(radius: 3)
                    .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                VStack{
                    Text("Leen")
                        .font(.title)
                    .fontWeight(.medium).frame(maxWidth: 350, alignment: .leading)
                    Text("Hi I'm Leen From Saudi Arabia Riyadh Love Reading and Drawing")
                        .font(.caption).frame(maxWidth: 350, alignment: .leading)
                }
                
                
            }
            
            VStack{
                
                VStack{ Text("Badges").font(.title3).frame(maxWidth: 350, alignment: .leading).padding()
                    Divider()
                    
                    ScrollView(.horizontal){
                        HStack{
                            Image("ByBadge")
                            Image("CBadge")
                            Image("PBadge")
                            Image("SBadge")
                        }.padding()
                        
                    }
                }
                
                VStack{ Text("Thoughts").font(.title3).frame(maxWidth: 350, alignment: .leading).padding()
                    Divider()
                    
                    Text("No thoughts has been shared yet.")
                    .font(.caption).padding()}
                
                
                VStack{ Text("Habit Tracker").font(.title3).frame(maxWidth: 350, alignment: .leading).padding()
                    Divider()
                    
                    Text("It takes 21 day to make a habit and 90 to turn it to a routine")
                    .font(.caption).padding()}
                
                VStack{ Text("Communities").font(.title3).frame(maxWidth: 350, alignment: .leading).padding()
                    
                    Divider()
                    
                    Text("Join your favorite communities.")
                    .font(.caption).padding()}
            }
            
            
            
            
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
