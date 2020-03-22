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

struct Challenge2: View {
    var body: some View {
        ZStack {
            Image("Breakfast")
                .resizable()
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                Image("TopGradient")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                Image("BottomGradient")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
            }
            VStack {
                HStack(alignment: .top, content: {
                    Text("Hardcore\nAvo Toast")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                    Image("Heart_health")
                        .padding([.top, .leading, .trailing])
                })
                Spacer()
                Text("Energize with this healthy and hearty breakfast")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
            }
        }
    }
}

struct Challenge3: View {
    
    @State var counter = 0
    
    var body: some View {
        VStack {
            Text(String(counter))
                .font(.system(size: 100, weight: .heavy))
                .padding(40)
            
            HStack {
                Button(action: {
                    self.counter = 0
                }) {
                    Image(systemName: "gobackward")
                        .font(.system(size: 40, weight: .heavy))
                        .padding(30)
                }
                Button(action: {
                    self.counter -= 1
                }) {
                     Image(systemName: "minus")
                        .font(.system(size: 40, weight: .heavy))
                        .padding(30)
                }
                Button(action: {
                    self.counter += 1
                }) {
                     Image(systemName: "plus")
                        .font(.system(size: 40, weight: .heavy))
                        .padding(30)
                }
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        Challenge3()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
