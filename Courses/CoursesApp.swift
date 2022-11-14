//
//  CoursesApp.swift
//  Courses
//
//  Created by Dmytro Churakov on 02.10.2022.
//

import SwiftUI

@main
struct CoursesApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
