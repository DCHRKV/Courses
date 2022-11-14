//
//  CourseView.swift
//  Courses
//
//  Created by Dmytro Churakov on 20.10.2022.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool

    var body: some View {
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 100)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            closeButton
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
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
        )
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text(course.title)
                    .font(.largeTitle.weight(.bold))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                Text(course.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
                Text(course.text)
                    .font(.footnote)
                    .lineLimit(1)
                    .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
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
                        .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
                )
                .offset(y: 240)
                .padding(20)
        )
    }
    private var content: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("21 topics".uppercased())
                .font(.title3).fontWeight(.medium).italic()
                .matchedGeometryEffect(id: "topics", in: namespace)
            Text("All techniques are explained step-by-step, in a beginner-friendly format so that you can easily follow in a cohesive way.")
                .font(.footnote).italic()
        }
        .padding()
    }

    private var closeButton: some View {
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
