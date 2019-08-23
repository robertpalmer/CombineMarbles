import Foundation
import SwiftUI

struct Marble: View {

    private var content: String? = nil

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.yellow)
            Text(content ?? "")
        }
    }

    func content(_ content: String?) -> Marble {
        var copy = self
        copy.content = content
        return copy
    }

}
