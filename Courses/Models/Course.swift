//
//  Course.swift
//  Courses
//
//  Created by Dmytro Churakov on 12.10.2022.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
    var background: String
    var link: String
}

var featuredCourses = [
    Course(title: "Build a SwiftUI app for iOS 15",
           subtitle: "21 sections - 4 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 5",
           logo: "Logo 2",
           background: "Background 3",
           link: "https://designcode.io/swiftui-ios15"),
    Course(title: "Build a SwiftUI app for iOS 15 Part 2",
           subtitle: "19 sections - 3 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 6",
           logo: "Logo 3",
           background: "Background 5",
           link: "https://designcode.io/swiftui-ios15-part2"),
    Course(title: "Build a SwiftUI app for iOS 15 Part 3",
           subtitle: "21 sections - 4 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 8",
           logo: "Logo 4",
           background: "Background 6",
           link: "https://designcode.io/swiftui-ios15-part3")
]

var courses = [
    Course(title: "Build a SwiftUI app for iOS 15",
           subtitle: "21 sections - 4 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 5",
           logo: "Logo 2",
           background: "Background 3",
           link: "https://designcode.io/swiftui-ios15"),
    Course(title: "Build a SwiftUI app for iOS 15 Part 2",
           subtitle: "19 sections - 3 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 6",
           logo: "Logo 3",
           background: "Background 5",
           link: "https://designcode.io/swiftui-ios15-part2"),
    Course(title: "Build a SwiftUI app for iOS 15 Part 3",
           subtitle: "21 sections - 4 hours",
           text: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more",
           image: "Illustration 8",
           logo: "Logo 4",
           background: "Background 6",
           link: "https://designcode.io/swiftui-ios15-part3")
]
