//
//  NavigationBar.swift
//  Courses
//
//  Created by Dmytro Churakov on 11.10.2022.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasCollapsed: Bool

    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasCollapsed ? 1 : 0)

            Text(title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasCollapsed ? -4 : 0)

            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)

                Image(systemName: "person.circle")
                    .font(.body.weight(.bold))
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasCollapsed ? -4 : 0)

        }
        .frame(height: hasCollapsed ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(hasCollapsed: .constant(false))
    }
}
