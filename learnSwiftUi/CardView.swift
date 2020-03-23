//
//  CardView.swift
//  learnSwiftUi
//
//  Created by Huynh Ngoc Dinh on 3/23/20.
//  Copyright © 2020 Huynh Ngoc Dinh. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let color:Color
    let label:String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width:300, height: 200)
                .foregroundColor(color)
                .cornerRadius(30)
            Text(label)
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(.white)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 3, y: 3)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: .red, label: "HINODI")
    }
}
