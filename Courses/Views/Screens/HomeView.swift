//
//  HomeView.swift
//  Courses
//
//  Created by Dmytro Churakov on 07.10.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var hasCollapsed = false
    private let coordinates = "scroll"
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                featured
            }
            .coordinateSpace(name: coordinates)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 100)
            })
            .overlay(
                NavigationBar(title: "Featured", hasCollapsed: $hasCollapsed)
        )
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named(coordinates)).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasCollapsed = value < 0
            }
        })
        
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / 5), axis: (x: 1, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.4), radius: 10, x: 0, y: 10)
                        .overlay(Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 210)
                            .offset(x: 40, y: -95)
                    )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 20))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
