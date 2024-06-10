//
//  LaunchView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading campaigns".map{ String($0)}
    @State private var showText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue,Color.background.primary], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            Text("Priper")
                .font(Font.custom("Times New Roman", size: 80))
                
            ZStack {
                if showText {
                    HStack(spacing:0){
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                
//                                .foregroundStyle(Color.text.primary)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y:70)
        }
        .onAppear {
            showText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex{
                    counter = 0
                    loops += 1
                    if loops >= 1 {
                        showLaunchView = false
                    }
                    
                } else {
                    counter += 1
                }
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
