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

struct Challenge4: View {
    let LIST_IMAGES = ["star", "apple", "cherry"]
    let BET_AMOUNTS = 5
    
    @State var credits = 1000
    
    @State var imageIndex1 = 0
    @State var imageIndex2 = 1
    @State var imageIndex3 = 2
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 196/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("HINODI Slots!")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.top, 30)
                .padding(.horizontal)
                .scaleEffect(2)
                Spacer()
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack {
                    Spacer()
                    Image(self.LIST_IMAGES[imageIndex1])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(self.LIST_IMAGES[imageIndex2])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(self.LIST_IMAGES[imageIndex3])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    self.credits -= self.BET_AMOUNTS * 4
                    
                    let imageIndex1 = Int.random(in: 0 ... self.LIST_IMAGES.count - 1)
                    let imageIndex2 = Int.random(in: 0 ... self.LIST_IMAGES.count - 1)
                    let imageIndex3 = Int.random(in: 0 ... self.LIST_IMAGES.count - 1)
                    
                    if (imageIndex1 == imageIndex2 && imageIndex2 == imageIndex3) {
                        self.credits += self.BET_AMOUNTS * 8
                    } else if (imageIndex1 == imageIndex2) {
                        self.credits += self.BET_AMOUNTS
                    } else if (imageIndex2 == imageIndex3) {
                        self.credits += self.BET_AMOUNTS
                    } else if (imageIndex3 == imageIndex1) {
                        self.credits += self.BET_AMOUNTS
                    }
                    
                    self.imageIndex1 = imageIndex1
                    self.imageIndex2 = imageIndex2
                    self.imageIndex3 = imageIndex3
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Challenge4()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
