//
//  BlobView.swift
//  Courses
//
//  Created by Dmytro Churakov on 05.10.2022.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false

    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSince1970
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let xCoordinates = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let xCoordinates2 = cos(angle2.radians)

            Canvas { context, size in
                context.fill(
                    path(in:CGRect(x:0,y:0,width:size.width,height:size.height),
                         xCoordinates:xCoordinates,xCoordinates2:xCoordinates2),
                    with:.linearGradient(Gradient(colors:[.purple,.white]),
                                         startPoint:CGPoint(x:0,y:0),
                                         endPoint:CGPoint(x:400,y:430)))
            }
            .frame(width: 400, height: 400)
            .rotationEffect(.degrees(appear ? 360 : 15))
        }
        .onAppear {
            withAnimation(.linear(duration: 30).repeatForever(autoreverses: true)) {
                appear = true
            }
        }
    }

    func path(in rect: CGRect, xCoordinates: Double, xCoordinates2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.95862*width, y: 0.41923*height))
        path.addCurve(to: CGPoint(x: 0.38966*width*xCoordinates2,
                                  y: 0.96923*height),
                      control1: CGPoint(x: 1.09655*width*xCoordinates2,
                                        y: 0.48846*height),
                      control2: CGPoint(x: 0.59533*width,
                                        y: 0.96923*height))
        path.addCurve(to: CGPoint(x: 0.01724*width,
                                  y: 0.56154*height),
                      control1: CGPoint(x: 0.18398*width,
                                        y: 0.96923*height),
                      control2: CGPoint(x: 0.01724*width,
                                        y: 0.68462*height))
        path.addCurve(to: CGPoint(x: 0.63103*width*xCoordinates,
                                  y: 0.00769*height*xCoordinates),
                      control1: CGPoint(x: 0.01724*width*xCoordinates,
                                        y: 0.43846*height*xCoordinates2),
                      control2: CGPoint(x: -0.01034*width,
                                        y: -0.06154*height*xCoordinates))
        path.addCurve(to: CGPoint(x: 0.95862*width,
                                  y: 0.41923*height),
                      control1: CGPoint(x: 1.27241*width*xCoordinates2,
                                        y: 0.07692*height*xCoordinates2),
                      control2: CGPoint(x: 0.82069*width,
                                        y: 0.35*height))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}
