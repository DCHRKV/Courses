//
//  Tab.swift
//  Courses
//
//  Created by Dmytro Churakov on 06.10.2022.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(name: "Learn now", image: "book", tab: .home, color: .blue),
    TabItem(name: "Explore", image: "magnifyingglass", tab: .explore, color: .red),
    TabItem(name: "Notifications", image: "bell", tab: .notifications, color: .yellow),
    TabItem(name: "Account", image: "person", tab: .account, color: .purple)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case account
}
