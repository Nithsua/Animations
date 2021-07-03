//
//  ContentView.swift
//  Animations
//
//  Created by Nivas Muthu M G on 01/07/21.
//

import SwiftUI

struct CornerRotationModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotationModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotationModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var animationAmountCF: CGFloat = 1
    @State private var animationAmount = 0.0
    @State private var letters = Array("Hello SwiftUI")
    @State private var toggle = false
    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false
    
    var body: some View {
        print(animationAmountCF)
        
        return VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            isShowingRed ? Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
//                .transition(.scale)
                .transition(.pivot)
                : nil
                
        }
//        return ScrollView {
//            VStack {
//                Stepper("Scale Amount", value: $animationAmountCF.animation(.easeInOut(duration: 1).repeatForever(autoreverses: true)), in: 1...10) //adding animation to binding
//                    .padding()
//                Text("Hello")
//                    .padding()
//                    .background(Color.gray)
//                    .foregroundColor(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                    .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.white, lineWidth: 2.0))
//                    .shadow(radius: 10)
//                    .scaleEffect(animationAmountCF)
////                Button("Tap Me"){
////    //                animationAmountCF += 1
////                }
////                .padding(50)
////                .background(Color.red)
////                .foregroundColor(.white)
////                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
////                .scaleEffect(animationAmountCF)
//
//
//                Button("Tap Me") {
//                    withAnimation {
//                        animationAmount += 360  //Adding animation to state
//                    }
//                }
//                .padding(50)
//                .background(Color.red)
//                .foregroundColor(.white)
//                .clipShape(Circle())
//                .rotation3DEffect(
//                    .degrees(animationAmount),
//                    axis: (x: 1.0, y: 0.0, z: 0.0)
//                )
//    //
//
//                Button("Tap Me") {
//                    toggle.toggle()
//                }
//                .frame(width: 200, height: 200)
//                .background(toggle ? Color.blue : Color.red)
//        //        .animation(.default)
//                .animation(nil)
//                .foregroundColor(.white)
//                .clipShape(RoundedRectangle(cornerRadius: toggle ? 60 : 0))
//                .animation(.interpolatingSpring(stiffness: 50, damping: 5))
//                .padding()
//
//
//                HStack {
//                    ForEach(0..<letters.count) { i in
//                        Text(String(letters[i]))
//                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                            .background(toggle ? Color.blue : Color.red )
//
//                            .offset(dragAmount)
//                            .animation(Animation.default.delay(Double(i) / 20))
//                    }
//                }
//                .background(toggle ? Color.blue : Color.red)
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount = $0.translation }
//                        .onEnded { _ in
//                            dragAmount = .zero
//                            toggle.toggle()
//                        }
//                )
//                .padding()
//
//
//                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .frame(width: 300, height: 200)
//                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                    .offset(dragAmount)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { dragAmount = $0.translation}
//                            .onEnded { _ in dragAmount = .zero}
//                    )
//                    .animation(.spring())
//                    .padding()
//
//
//                Button("Tap Me") {
//        //            animationAmountCF += 1
//                }
//                .padding(50)
//                .background(Color.red)
//                .foregroundColor(Color.white)
//                .clipShape(Circle())
//                .overlay(
//                    Circle()
//                        .stroke(Color.red)
//                        .scaleEffect(animationAmountCF)
//                        .opacity(Double(2 - animationAmountCF))
//                        .animation(       //adding animation to view
//        //                  Animation.interpolatingSpring(stiffness: 50, damping: 5)
//                            .easeInOut(duration: 1)
//        //                      .repeatCount(3, autoreverses: true)
//                                .repeatForever(autoreverses: false)
//        //                        .delay(1)
//                        )
//                ).onAppear {
//                    animationAmountCF += 1
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
