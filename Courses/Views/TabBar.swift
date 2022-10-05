//
//  TabBar.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Learn now")
                }
            PersonView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
