import SwiftUI

struct DocumentationLink: View {

    let name: String
    let url: String
    let navigator: WebNavigator?

    var body: some View {
        VStack {
            Divider().padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            Button(action: {
                self.navigator?.gotoWebView(url: self.url)
            }, label: {
                HStack {
                    Text(" Documentation for ") +
                        Text(self.name).font(Font.custom("Menlo-Bold", size: 16))
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(Color.gray)
                }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            })
            Divider()
        }
    }
}
struct DocumentationLink_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationLink(name: "map()", url: "", navigator: nil)
    }
}
