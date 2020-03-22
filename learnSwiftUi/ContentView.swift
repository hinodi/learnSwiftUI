//
//  ContentView.swift
//  learnSwiftUi
//
//  Created by Huynh Ngoc Dinh on 3/22/20.
//  Copyright © 2020 Huynh Ngoc Dinh. All rights reserved.
//

import SwiftUI

struct MyImage: View
{
    static let IMAGE_DEFAULT_SIZE = CGFloat(50)
    let imageName: String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    init(_ imageName: String, imageWidth: CGFloat? = IMAGE_DEFAULT_SIZE, imageHeight: CGFloat? = IMAGE_DEFAULT_SIZE) {
        self.imageName = imageName
        self.imageWidth = imageWidth!
        self.imageHeight = imageHeight!
    }

    var body: some View {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: imageWidth, height: imageWidth)
    }
}

struct Challenge1: View {
    var body: some View {
       VStack {
            Spacer()
            HStack {
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
                MyImage("tomato")
                Spacer()
            }
            Spacer()
        }
    }
}


struct ContentView: View {
    var body: some View {
        Challenge1()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
