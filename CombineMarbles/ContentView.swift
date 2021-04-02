import SwiftUI
import Combine

struct ContentView: View {

    @State var displayHelp: Bool = false
    
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
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Button("help") { displayHelp = true }
                }
            })
        }.sheet(isPresented: $displayHelp, content: {
            AboutScreen() { displayHelp = false }
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct AboutNavigationStyle: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let navigationController = uiViewController.navigationController {
            navigationController.navigationBar.backgroundColor = .white
        }
    }
}
