import Foundation
import SwiftUI

struct Marble: View {

    var content: String? = nil

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("navigationBarColor"))
            Text(content ?? "")
                .foregroundColor(Color("marbleForeground"))
        }
    }

}
