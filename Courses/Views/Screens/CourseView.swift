//
//  CourseView.swift
//  Courses
//
//  Created by Dmytro Churakov on 20.10.2022.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool

    var body: some View {
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            button
        }
    }
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("Background 3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI for iOS 15")
                    .font(.largeTitle.weight(.bold))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .matchedGeometryEffect(id: "title", in: namespace)
                Text("21 sections - 4 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more")
                    .font(.footnote)
                    .lineLimit(1)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Divider()
                HStack {
                    Image(systemName: "person.circle")
                        .font(.body.weight(.bold))
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 14)
                    Text("Taught by: Ment To")
                        .font(.footnote)
                }
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 240)
                .padding(20)
        )
    }
    private var content: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("21 topics".uppercased())
                .font(.title3).fontWeight(.medium).italic()
            Text("All techniques are explained step-by-step, in a beginner-friendly format so that you can easily follow in a cohesive way.")
                .font(.footnote).italic()
        }
        .padding()
    }

    private var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.bold())
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
