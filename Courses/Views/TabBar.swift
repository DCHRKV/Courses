//
//  TabBar.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    Image(systemName: "book")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 80, height: 30)
                    Text("Learn now")
                        .font(.caption2)
                }
                Spacer()
                VStack(spacing: 0) {
                    Image(systemName: "person")
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 80, height: 30)
                    Text("Account")
                        .font((.caption2))
                }
                Spacer()
        }
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
