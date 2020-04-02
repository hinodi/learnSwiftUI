//
//  FirstTab.swift
//  learnSwiftUi
//
//  Created by Huynh Ngoc Dinh on 4/2/20.
//  Copyright © 2020 Huynh Ngoc Dinh. All rights reserved.
//

import SwiftUI

struct FirstTab: View {
    @EnvironmentObject var data: Data
    
    var body: some View {
        VStack {
            Text(String(self.data.count))
            Button(action: {
                self.data.count += 1
            }) {
                Text("Click me!")
            }
            .padding(.all)
        }
        
    }
}

struct FirstTab_Previews: PreviewProvider {
    static var previews: some View {
        FirstTab().environmentObject(Data())
    }
}
