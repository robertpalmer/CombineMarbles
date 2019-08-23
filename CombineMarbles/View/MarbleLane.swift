import Foundation
import SwiftUI

struct ArrowShape: Shape {

    let headLength: CGFloat = 15
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - headLength, y: rect.maxY))
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - headLength, y: rect.minY))
        }
    }
}

struct MarbleLane: View {

    @Binding var pos: [TimedEvent]
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in

                ArrowShape()
                    .stroke(Color.black)
                    .frame(width: proxy.size.width, height: 24)
                    .position(x: proxy.size.width / 2, y: proxy.size.height / 2)

                ForEach(self.pos) { element in
                    Group {
                        MovableView(element.view)
                            .pos(proxy.denormalize(x: element.pos), y: proxy.size.height / 2)
                            .onPositionChange({
                                if let index = self.pos.firstIndex(of: element) {
                                    self.pos[index].pos = proxy.normalize(x: $0)
                                }
                            })
                            .frame(width: 34, height: 34, alignment: .center)
                            .zIndex(element.zIndex)
                    }
                }
            }
        }
    }
}

private extension TimedEvent {

    var view: some View {
        switch type {
        case .next:
            return AnyView(Marble().content(content))
        case .finished:
            return AnyView(Finished())
        case .error:
            return AnyView(ErrorView())
        }
    }

    var zIndex: Double {
        switch type {
        case .next:
            return 1
        case .finished, .error:
            return 0
        }
    }
}

private extension GeometryProxy {

    func normalize(x: CGFloat) -> Double {
        let width = frame(in: .global).width
        return Double(x / width)
    }

    func denormalize(x: Double) -> CGFloat {
        let width = frame(in: .global).width
        return CGFloat(x) * width
    }
}

private extension TimedEvent {

    var pos: Double {
        get { Double(timeInterval) / 100 }
        set { timeInterval = Int(newValue * 100) }
    }
}
