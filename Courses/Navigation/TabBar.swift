//
//  TabBar.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .blue
    var body: some View {
        HStack {
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            backgroundCircle
        )
        .overlay(
            overlayLine
        )
        .strokeStyle(cornerRadius: 30)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.9)) {
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.image)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 30)
                    Text(item.name)
                        .font(.caption2)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
        }
    }
    
    var backgroundCircle: some View {
        HStack {
            if selectedTab == .account { Spacer()}
            if selectedTab == .explore { Spacer()}
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: 80)
            if selectedTab == .home { Spacer()}
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer()}
        }
        .padding(.horizontal, 8)
    }
    
    var overlayLine: some View {
        HStack {
            if selectedTab == .account { Spacer()}
            if selectedTab == .explore { Spacer()}
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 5)
                .cornerRadius(3)
                .frame(width: 80)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer()}
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifications { Spacer()}
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewInterfaceOrientation(.portrait)
    }
}
