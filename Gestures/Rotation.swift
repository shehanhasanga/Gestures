//
//  Rotation.swift
//  Gestures
//
//  Created by shehan karunarathna on 2022-02-22.
//

import SwiftUI

struct Rotation: View {
    @State var currentAmount  = Angle(degrees: 0)
    var body: some View {
      
        Text("Sample")
            .font(.system(size: 10))
            .padding()
            .background(.red)
            .rotationEffect(currentAmount)
            .gesture(
                RotationGesture().onChanged({ val in
                    currentAmount = val
                })
                    .onEnded({ val in
                        withAnimation {
                            currentAmount = Angle(degrees: 0)
                        }
                       
                    })
            )
    }
}

struct Rotation_Previews: PreviewProvider {
    static var previews: some View {
        Rotation()
    }
}
