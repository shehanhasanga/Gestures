//
//  Magnifing.swift
//  Gestures
//
//  Created by shehan karunarathna on 2022-02-22.
//

import SwiftUI

struct Magnifing: View {
    @State var currentAmount : CGFloat = 0
    @State var lastAmount :CGFloat = 0
    var body: some View {
        Text("Sample")
            .font(.system(size: 10))
            .padding()
            .background(.red)
            .scaleEffect(1 + lastAmount + currentAmount)
            .gesture(
                MagnificationGesture().onChanged({ val in
                    currentAmount = val - 1
                })
                    .onEnded({ val in
                        lastAmount = 0
                    })
            )
    }
}

struct Magnifing_Previews: PreviewProvider {
    static var previews: some View {
        Magnifing()
    }
}
