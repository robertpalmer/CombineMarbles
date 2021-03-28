import SwiftUI
import Combine

struct ContentView: View {

    let content: [OperatorCollection] = [
        .map,
        .filter,
        .reduce,
        .mathematical,
        .matching,
        .sequence,
        .select,
        .combine,
        .timing
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(content, id: \.name) { section in
                    Section(header: ListHeader(text: section.name)) {
                        ForEach(section.operators, id: \.name) {
                            NavigationLink($0.name, destination: MarblesScreen(operation: $0))
                            .font(Font.custom("Menlo", size: 16))
                        }
                    }
                }
            }
            .navigationBarTitle("Operators")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
