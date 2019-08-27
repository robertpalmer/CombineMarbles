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
                    Section(header: Text(section.name)) {
                        ForEach(section.operators, id: \.name) {
                            NavigationLink($0.name, destination: MarblesScreen(operation: $0))
                        }
                    }
                }
            }.navigationBarTitle("Functions")
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
