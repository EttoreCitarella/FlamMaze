//
//  Lose.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SwiftUI

struct Lose: View {
    var body: some View {
        
        VStack{
            Text("You Lose")
                .font(.largeTitle)
            
            ZStack{
                Image("Lose")
                    .resizable()
                    .frame(width: 280, height: 260)
                    .padding(.top, 130)
                
                Image("FlammyLose")
                    .resizable()
                    .frame(width: 180, height: 160)
                    .padding(.top, 470)
            }
            
            
            NavigationStack{
                
                Button {
                   SecondPage()
                } label: {
                    
                    
                    ZStack{
                       
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue.opacity(1), lineWidth: 3)
                                .shadow(color: Color.blue.opacity(0.9), radius: 0, x:0, y:+2.0)
                                .frame(width: 260, height: 50)
                                .foregroundColor(.black)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.cyan)
                                .frame(width: 260, height: 50)
                            
                            Text("REPLY")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                            
                    }

                  

                    
                }
                
                Button {
                    Score()
                } label: {
                    ZStack{
                       
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.blue.opacity(1), lineWidth: 3)
                                .shadow(color: Color.blue.opacity(0.9), radius: 0, x:0, y:+2.0)
                                .frame(width: 260, height: 50)
                                .foregroundColor(.black)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.cyan)
                                .frame(width: 260, height: 50)
                            
                            Text("HOME")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                            
                    }

                    

                    
                }
                
                }
           

                
            }
            
           
        }
    }


struct Lose_Previews: PreviewProvider {
    static var previews: some View {
        Lose()
    }
}
