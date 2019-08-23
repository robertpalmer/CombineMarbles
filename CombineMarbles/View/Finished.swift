import SwiftUI

private struct FinishedShape: Shape {

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct Finished: View {
    var body: some View {
        FinishedShape()
            .stroke(lineWidth: 2)
            .stroke(Color.red)
            .foregroundColor(.red)
    }
}

#if DEBUG
struct Complete_Previews: PreviewProvider {
    static var previews: some View {
        Finished()
    }
}
#endif
