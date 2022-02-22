//
//  Mask.swift
//  Gestures
//
//  Created by shehan karunarathna on 2022-02-22.
//

import SwiftUI

struct Mask: View {
    @State var current: Int = 2
    var body: some View {
        ZStack{
            starview
            .overlay(
                
                overview
                    .mask(starview)
                  
                   
            )
          
           
          
        }
    }
    
}

extension Mask {
    var overview : some View {
        GeometryReader{
            geo in
            ZStack(alignment:.leading){
                Rectangle()
                    .foregroundColor(.yellow)
                   
                    .frame(width : CGFloat(current) / 5 * geo.size.width)
                   
            }
           
          
           
        }
        .allowsHitTesting(false)
    }
    var starview : some View {
        HStack{
            ForEach (0..<5, id: \.self){
                i in
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation {
                            current = i + 1
                        }
                        
                    }
                    
            }
            
            
        }
    }
}

struct Mask_Previews: PreviewProvider {
    static var previews: some View {
        Mask()
    }
}
