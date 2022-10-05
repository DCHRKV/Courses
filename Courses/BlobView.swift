//
//  BlobView.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct BlobView: View {
    var body: some View {
        BlobShape()
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95862*width, y: 0.41923*height))
        path.addCurve(to: CGPoint(x: 0.38966*width, y: 0.96923*height), control1: CGPoint(x: 1.09655*width, y: 0.48846*height), control2: CGPoint(x: 0.59533*width, y: 0.96923*height))
        path.addCurve(to: CGPoint(x: 0.01724*width, y: 0.56154*height), control1: CGPoint(x: 0.18398*width, y: 0.96923*height), control2: CGPoint(x: 0.01724*width, y: 0.68462*height))
        path.addCurve(to: CGPoint(x: 0.63103*width, y: 0.00769*height), control1: CGPoint(x: 0.01724*width, y: 0.43846*height), control2: CGPoint(x: -0.01034*width, y: -0.06154*height))
        path.addCurve(to: CGPoint(x: 0.95862*width, y: 0.41923*height), control1: CGPoint(x: 1.27241*width, y: 0.07692*height), control2: CGPoint(x: 0.82069*width, y: 0.35*height))
        path.closeSubpath()
        return path
    }
}
