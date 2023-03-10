//
//  FirstPage.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SwiftUI
import SpriteKit

struct FirstPage: View {
    let color1 = Color(red: 0.45, green: 0.12, blue: 0.24).opacity(0.8)
    let color2 = Color(red: 0.40, green: 0.01, blue: 0.55).opacity(0.8)
    var body: some View {
        NavigationStack{
       
            ZStack {
//                LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
//                       
                VStack{
             
                Image("SuperFlammy")
                    .resizable()
                    .frame(width: 180, height: 260)
                    .padding(.top, 230)
               
                
                Spacer()
                
                NavigationLink {
                    SecondPage()
                } label: {
                    ZStack{
                        
//
//                            RoundedRectangle(cornerRadius: 15)
//                               .stroke(.blue.opacity(1), lineWidth: 3)
//                               .shadow(color: Color.blue.opacity(0.9), radius: 0, x:0, y:+2.0)
//                               .frame(width: 260, height: 50)
//                            .foregroundColor(.black)
//
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(.cyan)
//                                .frame(width: 260, height: 50)
                            
                            Text("START")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .opacity(0.70)
                                .shadow(color: .black, radius: 5, x: -3, y: 8)
                                .font(.title2)
                                .frame(width: 290, height: 90)
                                .background(color1)
                                .cornerRadius(40)
                            
                    }

                  
                }

                
                    // inerire navigation link
                  
                    
                    NavigationLink {
                        Score()
                    } label: {
                        ZStack{
//
//                                RoundedRectangle(cornerRadius: 15)
//                                    .stroke(.blue.opacity(1), lineWidth: 3)
//                                    .shadow(color: Color.blue.opacity(0.9), radius: 0, x:0, y:+2.0)
//                                    .frame(width: 260, height: 50)
//                                    .foregroundColor(.black)
//
//                                RoundedRectangle(cornerRadius: 15)
//                                    .fill(.cyan)
//                                    .frame(width: 260, height: 50)
//
                                Text("SCORE")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .opacity(0.70)
                                .shadow(color: .black, radius: 5, x: -3, y: 8)
                                .font(.title2)
                                .frame(width: 290, height: 90)
                                .background(color1)
                                .cornerRadius(40)
                                
                        }

                        .padding(.top)

                        
                    }
                    .padding(.all)
                }
            }

        
       
            }
       
        }
    }

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
