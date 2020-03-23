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
    let BET_AMOUNTS = 10
    @State var credits = 1000
    
    @State private var listImages = ["star", "apple", "cherry"]
    @State var imageIndexs = [0, 1, 2, 1, 0, 2, 2, 0, 1]
    
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
                    ListItemView(imageName: $listImages[imageIndexs[0]])
                    ListItemView(imageName: $listImages[imageIndexs[1]])
                    ListItemView(imageName: $listImages[imageIndexs[2]])
                    Spacer()
                }
                HStack {
                    Spacer()
                    ListItemView(imageName: $listImages[imageIndexs[3]])
                    ListItemView(imageName: $listImages[imageIndexs[4]])
                    ListItemView(imageName: $listImages[imageIndexs[5]])
                    Spacer()
                }
                HStack {
                    Spacer()
                    ListItemView(imageName: $listImages[imageIndexs[6]])
                    ListItemView(imageName: $listImages[imageIndexs[7]])
                    ListItemView(imageName: $listImages[imageIndexs[8]])
                    Spacer()
                }
                
                Spacer()
                Button(action: {
                    self.funcCheckWin()
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
    
    func funcCheckWin () {
        self.credits -= self.BET_AMOUNTS
        
        self.imageIndexs = self.imageIndexs.map {_ in
            Int.random(in: 0 ... self.listImages.count - 1)
        }
        
        let winRow1 = checkWinRow(0, 1, 2)
        let winRow2 = checkWinRow(3, 4, 5)
        let winRow3 = checkWinRow(6, 7, 8)
        if (winRow1 && winRow2 && winRow3) {
            self.credits += self.BET_AMOUNTS * 6
        } else if ((winRow1 && winRow2) || (winRow1 && winRow3) || (winRow2 && winRow3)) {
            self.credits += self.BET_AMOUNTS * 4
        } else if (winRow1 || winRow2 || winRow3) {
            self.credits += self.BET_AMOUNTS * 2
        }
    }
    
    func checkWinRow(_ i1:Int, _ i2:Int, _ i3: Int) -> Bool {
        return self.imageIndexs[i1] == self.imageIndexs[i2] && self.imageIndexs[i1] == self.imageIndexs[i3]
    }
}

struct Challenge5: View {
    @State var anim = false
    
    var body: some View {
        ZStack {
            CardView(color: .red, label: "Red")
                .offset(x: 0, y: anim ? -220 : 20)
                .scaleEffect(anim ? 1 : 0.8)
            CardView(color: .blue, label: "Blue")
                .offset(x: 0, y: anim ? -50 : 40)
                .scaleEffect(anim ? 1 : 0.9)
            
            CardView(color: .black, label: "Tap me")
                .offset(x: 0, y: anim ? 200 : 60)
                .onTapGesture {
                    self.anim.toggle()
            }
        }
        .animation(.spring())
    }
}

struct ContentView: View {
    var body: some View {
        Challenge5()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
