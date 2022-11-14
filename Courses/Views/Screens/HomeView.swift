//
//  HomeView.swift
//  Courses
//
//  Created by Dmytro Churakov on 07.10.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var hasCollapsed = false
    @Namespace var namespace
    @State private var courseViewShown = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    private let coordinates = "scroll"

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                featured
                Text("Courses in progress".uppercased())
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                if !courseViewShown {
                    cards
                } else {
                    ForEach(courses) { course in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(300)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                        .padding(.horizontal, 30)
                    }
                }
            }
            .coordinateSpace(name: coordinates)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 100)
            })
            .overlay(
                NavigationBar(title: "Featured", hasCollapsed: $hasCollapsed)
            )
            if courseViewShown {
                detail
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: courseViewShown) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }

    private var scrollDetection: some View {
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

    private var featured: some View {
        TabView {
            ForEach(featuredCourses) { course in
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
    private var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, course: course, show: $courseViewShown)
                .onTapGesture {
                    withAnimation(.openCard) {
                        courseViewShown.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
                }
        }
    }
    private var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, course: course, show: $courseViewShown)
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                                            removal: .opacity.animation(.easeInOut(duration: 0.1))))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
