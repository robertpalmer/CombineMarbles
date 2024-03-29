import Foundation
import SwiftUI

struct Marble: View {

    var content: String? = nil

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 44, height: 44)
                .foregroundColor(.navigationBarColor)
            Text(content ?? "")
                .foregroundColor(.foreground)
        }
    }

}
