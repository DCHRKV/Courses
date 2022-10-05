//
//  BlobView.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct BlobView: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSince1970
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
//            Text("Value \(x)")
            
            Canvas { context, size in
                context.fill(path(in: CGRect(x:0, y:0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.white, .pink]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 430)))
                
            }
            .frame(width: 400, height: 400)
        }
    }
    
    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95862*width, y: 0.41923*height))
        path.addCurve(to: CGPoint(x: 0.38966*width*x2, y: 0.96923*height*x2), control1: CGPoint(x: 1.09655*width, y: 0.48846*height), control2: CGPoint(x: 0.59533*width, y: 0.96923*height))
        path.addCurve(to: CGPoint(x: 0.01724*width*x, y: 0.56154*height), control1: CGPoint(x: 0.18398*width*x, y: 0.96923*height), control2: CGPoint(x: 0.01724*width, y: 0.68462*height*x))
        path.addCurve(to: CGPoint(x: 0.63103*width*x, y: 0.00769*height), control1: CGPoint(x: 0.01724*width*x, y: 0.43846*height*x2), control2: CGPoint(x: -0.01034*width, y: -0.06154*height*x))
        path.addCurve(to: CGPoint(x: 0.95862*width, y: 0.41923*height), control1: CGPoint(x: 1.27241*width, y: 0.07692*height*x2), control2: CGPoint(x: 0.82069*width, y: 0.35*height))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

//struct BlobShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let width = rect.size.width
//        let height = rect.size.height
//        path.move(to: CGPoint(x: 0.95862*width, y: 0.41923*height))
//        path.addCurve(to: CGPoint(x: 0.38966*width, y: 0.96923*height), control1: CGPoint(x: 1.09655*width, y: 0.48846*height), control2: CGPoint(x: 0.59533*width, y: 0.96923*height))
//        path.addCurve(to: CGPoint(x: 0.01724*width, y: 0.56154*height), control1: CGPoint(x: 0.18398*width, y: 0.96923*height), control2: CGPoint(x: 0.01724*width, y: 0.68462*height))
//        path.addCurve(to: CGPoint(x: 0.63103*width, y: 0.00769*height), control1: CGPoint(x: 0.01724*width, y: 0.43846*height), control2: CGPoint(x: -0.01034*width, y: -0.06154*height))
//        path.addCurve(to: CGPoint(x: 0.95862*width, y: 0.41923*height), control1: CGPoint(x: 1.27241*width, y: 0.07692*height), control2: CGPoint(x: 0.82069*width, y: 0.35*height))
//        path.closeSubpath()
//        return path
//    }
//}
