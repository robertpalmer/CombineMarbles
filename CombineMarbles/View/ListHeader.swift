import SwiftUI

struct ListHeader: View {

    let text: String
    var body: some View {
        Text(text)
            .font(Font.custom("Avenir-Heavy", size: 16))
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(text: "Hallo World")
    }
}
