//
//  Drag.swift
//  Gestures
//
//  Created by shehan karunarathna on 2022-02-22.
//

import SwiftUI

struct Drag: View {
    @State var offset:CGSize = .zero
    var body: some View {
       RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 500)
            .offset(offset)
            .scaleEffect(getScale())
            .rotationEffect(Angle(degrees: getRotation()))
            .gesture(
                DragGesture()
                    .onChanged({ val in
                        offset = val.translation
                    })
                    .onEnded({ val in
                        offset = .zero
                    })
            )
        
    }
    func getScale() -> CGFloat {
        let max =  UIScreen.main.bounds.width / 2
        let current  = abs(offset.width)
        let percentage  = current / max
        return 1 - min(percentage, 0.5) * 0.5
        
    }
    func getRotation() -> Double {
        let max =  UIScreen.main.bounds.width / 2
        let current  = offset.width
        let percentage  = current / max
        let doublePercentage = Double(percentage)
        let maxAngle:Double = 10
        return maxAngle * doublePercentage
    }
}

struct Drag_Previews: PreviewProvider {
    static var previews: some View {
        Drag()
    }
}
