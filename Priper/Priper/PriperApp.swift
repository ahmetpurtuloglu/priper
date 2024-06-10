//
//  PriperApp.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

@main
struct PriperApp: App {
    @StateObject var viewModel = HomeViewModel()
    @State private var showLauncView: Bool = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(viewModel)
                ZStack {
                    if showLauncView {
                        LaunchView(showLaunchView: $showLauncView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
