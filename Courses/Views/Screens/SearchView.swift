//
//  SearchView.swift
//  Courses
//
//  Created by Dmytro Churakov on 10.01.2023.
//

import SwiftUI

struct SearchView: View {

    @State var text = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(courses.filter { $0.title.contains(text) }) { item in
                    Text(item.title)
                }
            }
            .searchable(text: $text,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Swift UI, Combine and Data, Concurrency")
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
