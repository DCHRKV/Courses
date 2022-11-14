//
//  ContentView.swift
//  Courses
//
//  Created by Dmytro Churakov on 02.10.2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        ZStack(alignment: .bottom) {

            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                PersonView()
            case .notifications:
                HomeView()
            case .account:
                PersonView()
            }
            TabBar()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 45)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13")
        }

    }
}
