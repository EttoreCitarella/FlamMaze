//
//  Score.swift
//  FlamMaze
//
//  Created by Ettore Developer on 06/03/23.
//

import SwiftUI

struct Score: View {
    var body: some View {
       
        
        VStack{
//            List {
//                Text("Elemento 1")
//                    .listRowBackground(Color.blue)
//                Text("Elemento 2")
//                    .listRowBackground(Color.green)
//                Text("Elemento 3")
//                    .listRowBackground(Color.red)
//            }
//
//            List {
//                Text("Elemento 1")
//                Text("Elemento 2")
//                Text("Elemento 3")
//            }
//            .listStyle(GroupedListStyle())
            
            
            List {
               Text("Elemento 1")
                 .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                 .overlay(
                     Image(systemName: "circle.fill")
                         .foregroundColor(.blue)
                         .font(.title)
                         .padding(.leading, 140)
                 )
               Text("Elemento 2")
                 .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                 .overlay(
                     Image(systemName: "circle.fill")
                         .foregroundColor(.green)
                         .font(.title)
                         .padding(.leading, 140)
                 )
               Text("Elemento 3")
                 .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                 .overlay(
                     Image(systemName: "circle.fill")
                         .foregroundColor(.red)
                         .font(.title)
                         .padding(.leading, 140)
                 )
            }

        }
    }
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score()
    }
}
