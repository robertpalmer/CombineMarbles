import Foundation
import SwiftUI

struct MovableView<V: View>: View {

    private let innerView: V

    private var position: CGPoint = .zero
    private var content: String? = nil
    private var onChange: ((CGFloat) -> ())? = nil

    init(_ innerView: V) {
        self.innerView = innerView
    }

    var body: some View {
        innerView
            .position(position)
            .gesture(DragGesture().onChanged {
                self.onChange?($0.location.x)
            })
    }

    func pos(_ x: CGFloat = 0, y: CGFloat = 0) -> MovableView<V> {
        var copy = self
        copy.position = CGPoint(x: x, y: y)
        return copy
    }

    func onPositionChange(_ onChange: @escaping ((CGFloat) -> ())) -> MovableView<V> {
        var copy = self
        copy.onChange = onChange
        return copy
    }
}
