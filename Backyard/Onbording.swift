//
//  Onbording1.swift
//  Backyard
//
//  Created by Amaal on 05/04/1444 AH.
//

import SwiftUI

struct Onbording: View {
    @State private var selectedTab = 2
    var body: some View {
      //  VStack {
                    TabView(selection: $selectedTab){
                        
                        VStack(){
                            
                            Image("LogoSto").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 250).padding()
                                Spacer()
                            Text("Welcome to  ")
                                .font(.system(size: 46)).frame(maxWidth: 350, alignment: .leading)
                            Text("Backyard")
                                .font(.system(size: 46))
                                .fontWeight(.bold).frame(maxWidth: 350, alignment: .leading).padding(.bottom)
                            
                            Text("A safe place to Develop yourself and to find Friends with the same interests. ")
                                .font(.system(size: 20))
                                .frame(maxWidth: 350, alignment: .leading)
                            Spacer()
                           } .tag(0)
                        
                        
                        VStack{
                            Image("comp").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 250).padding()
                            
                            Spacer()
                                
                            Text("Soul")
                                .font(.system(size: 46)).fontWeight(.bold).frame(maxWidth: 350, alignment: .leading)
                            Text("Compass")
                                .font(.system(size: 46))
                                .fontWeight(.bold).frame(maxWidth: 350, alignment: .leading).padding(.bottom)
                            
                            Text("You will find you Passion and talent by discovering new Hobbies and track your progress. ")
                                .font(.system(size: 20))
                                .frame(maxWidth: 350, alignment: .leading)
                            
                            Spacer()
                                
                            }.tag(1)
                        
                        
                        VStack{
                            Image("tree").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 300).padding()
                            
                            Spacer()
                                
                            Text("Have")
                                .font(.system(size: 46)).fontWeight(.bold).frame(maxWidth: 350, alignment: .leading)
                            Text("Fun")
                                .font(.system(size: 46))
                                .fontWeight(.bold).frame(maxWidth: 350, alignment: .leading).padding(.bottom)
                            
                            Text("Backyard is your new Tree house, just socialized to develop yourself and have fun. ")
                                .font(.system(size: 20))
                                .frame(maxWidth: 350, alignment: .leading)
                            
                            Spacer()
                            
                        }.tag(2)
                    }
                    .frame(width: .infinity, height: .infinity)
                    .tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always))
                }
            
    }
//}

struct Onbording1_Previews: PreviewProvider {
    static var previews: some View {
        Onbording()
    }
}
