//
//  PersonView.swift
//  Courses
//
//  Created by Dmytro Churakov on 04.10.2022.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 20) {
                    Image(systemName:
                            "person.crop.circle.fill.badge.checkmark")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 30))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .blue.opacity(0.3))
                    .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image("Background 7")
                        .offset(x: -50, y: -330)
                
                )
                    Text("Dmytro Churakov")
                        .font(.title.weight(.semibold))
                    Text("Ukraine")
                        .font(.subheadline)
                        .foregroundStyle(.linearGradient(colors: [.blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .frame(maxWidth: .infinity)
                .padding()
                Section {
                    Label("Settings", systemImage: "gearshape")
                    Label("Payment", systemImage: "creditcard.and.123")
                    Label("Help", systemImage: "questionmark.circle")
                }
                .listStyle(.insetGrouped)
                .listRowSeparator(.hidden)
                .navigationTitle("Account")
            }
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
