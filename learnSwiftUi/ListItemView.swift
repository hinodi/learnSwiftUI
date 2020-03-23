//
//  ListItemView.swift
//  learnSwiftUi
//
//  Created by Huynh Ngoc Dinh on 3/23/20.
//  Copyright © 2020 Huynh Ngoc Dinh. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    @Binding var imageName:String
    
    var body: some View {
        Image(imageName)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .background(Color.white.opacity(0.5))
        .cornerRadius(20)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(imageName: Binding.constant("apple"))
    }
}
