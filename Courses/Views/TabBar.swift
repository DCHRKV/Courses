//
//  TabBar.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .home:
                    ContentView()
                case .notifications:
                    PersonView()
                case .account:
                    PersonView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        selectedTab = item.tab
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
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 30, style: .continuous))
            .strokeStyle(cornerRadius: 30)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
