//
//  ContentView.swift
//  DraggableButton
//
//  Created by omer sanli on 20.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var butonGenisligi: Double = UIScreen.main.bounds.width - 80
    @State var butonOffset: CGFloat = 0
    
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(.blue)
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(8)
            HStack{
                ZStack{
                    Circle()
                        .padding(8)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                    
                }
                .offset(x: butonOffset)
                .gesture(DragGesture()
                            .onChanged({ gesture in
                    if gesture.translation.width >= 0 && gesture.translation.width <= butonGenisligi - 80 {
                        butonOffset = gesture.translation.width
                    }
 
                })
                            .onEnded({ gesture in
                    if butonOffset <= butonGenisligi / 2 {
                        butonOffset = 0
                    }
                    else{
                        
                    }
                    
                    
                })
                
                )
                
                
                // Zstack sonu
              
                    Spacer()
            }// HSTack sonu
         
            
            
        }.frame(width: butonGenisligi, height: 80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
