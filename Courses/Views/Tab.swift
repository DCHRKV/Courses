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
}

var tabItems = [
    TabItem(name: "Learn now", image: "book", tab: .home),
    TabItem(name: "Notifications", image: "bell", tab: .notifications),
    TabItem(name: "Account", image: "person", tab: .account)
]

enum Tab: String {
    case home
    case notifications
    case account
}
