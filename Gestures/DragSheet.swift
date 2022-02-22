//
//  DragSheet.swift
//  Gestures
//
//  Created by shehan karunarathna on 2022-02-22.
//

import SwiftUI

struct DragSheet: View {
    @State var startOffset:CGFloat  = UIScreen.main.bounds.height * 0.85
    @State var currentOffset:CGFloat  = 0
    @State var endingOffset:CGFloat  = 0
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            VStack(spacing:20){
                Image(systemName: "chevron.up")
                    .padding()
                Text("sign up")
                    .font(.title2)
                    .bold()
                Image(systemName: "flame")
                    .font(.system(size: 100))
                Text("this is a sample seet with gestures")
                Text("Create Account")
                    .font(.title2)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                Spacer()
            }
            .frame(maxWidth:.infinity)
            .background(.white)
            .cornerRadius(30)
            .offset(y:startOffset)
            .offset(y:currentOffset)
            .offset(y:endingOffset)
            .gesture(DragGesture().onChanged({ val in
                currentOffset = val.translation.height
            })
                        .onEnded({ val in
                withAnimation(.spring()) {
                    if currentOffset < 150 {
                        endingOffset = -startOffset
                        currentOffset = 0
                    } else if (endingOffset != 0 && currentOffset > 150){
                        endingOffset = 0
                        currentOffset = 0
                        
                    }
                    
                    else {
                        currentOffset = 0
                    }
                    
                }
            })
            )
        }
        .ignoresSafeArea( edges: .bottom)
       
    }
}

struct DragSheet_Previews: PreviewProvider {
    static var previews: some View {
        DragSheet()
    }
}
