//
//  SecondTab.swift
//  learnSwiftUi
//
//  Created by Huynh Ngoc Dinh on 4/2/20.
//  Copyright © 2020 Huynh Ngoc Dinh. All rights reserved.
//

import SwiftUI

struct SecondTab: View {
    @EnvironmentObject var data: Data
    
    var body: some View {
        Text(String(self.data.count))
    }
}

struct SecondTab_Previews: PreviewProvider {
    static var previews: some View {
        SecondTab().environmentObject(Data())
    }
}
