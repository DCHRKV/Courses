//
//  MatchedView.swift
//  Courses
//
//  Created by Dmytro Churakov on 13.10.2022.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State private var show = false

    var body: some View {
        ZStack {
            if !show {
                collapsedCourseView
                .padding(20)
                .foregroundStyle(.white)
                .background(
                    Color.black.matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)
            } else {
                expandedCourseView
                .padding(20)
                .foregroundStyle(.black)
                .background(
                    Color.blue.matchedGeometryEffect(id: "background", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }

    var collapsedCourseView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Build a SwiftUI app for iOS 15")
                .font(.largeTitle.weight(.bold))
                .lineLimit(1)
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle", in: namespace)
            Text("Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more")
                .font(.footnote)
                .lineLimit(1)
                .matchedGeometryEffect(id: "text", in: namespace)
        }
    }

    var expandedCourseView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            Text("Build a SwiftUI app for iOS 15")
                .font(.largeTitle.weight(.bold))
                .lineLimit(1)
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle", in: namespace)
            Text("Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more")
                .font(.footnote)
                .lineLimit(1)
                .matchedGeometryEffect(id: "text", in: namespace)
        }
    }

}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
