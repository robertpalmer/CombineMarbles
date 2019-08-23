import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("X")
            .foregroundColor(.red)
            .font(.system(size: 30))
    }
}

struct Error_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
