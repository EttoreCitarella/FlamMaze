//
//  SecondPage.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SwiftUI

struct SecondPage: View {
    let color1 = Color(red: 0.45, green: 0.12, blue: 0.24).opacity(0.8)
    let color2 = Color(red: 0.40, green: 0.01, blue: 0.55).opacity(0.8)
    var body: some View {
        NavigationStack {
            
            // eliminare nav stack
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()

                
                VStack{
                    Image("Direction")
                        .resizable()
                        .frame(width: 280, height: 180)
                        .padding(.top, 250)
                        .padding(.all, 70)
                    Text("Direct with your phone")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.bottom,30)
                    // inserire nav link
                    NavigationLink {
                        Container()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        ZStack{
                            
//
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(.blue.opacity(1), lineWidth: 3)
//                                .shadow(color: Color.blue.opacity(0.9), radius: 0, x:0, y:+2.0)
//                                .frame(width: 260, height: 50)
//                                .foregroundColor(.black)
//
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(.cyan)
//                                .frame(width: 260, height: 50)
                            
                            Text("Tap To Continue")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .opacity(0.70)
                                .shadow(color: .black, radius: 5, x: -3, y: 8)
                                .font(.title2)
                                .frame(width: 290, height: 90)
                                .background(color1)
                                .cornerRadius(40)
                            
                            
                        }
                        
                        .padding(.bottom,90)
                        
                        
                    }
                    
                }
              
                .ignoresSafeArea(.all)
                
                
                .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
            }
            
        }
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
