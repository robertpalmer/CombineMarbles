import SwiftUI
import Combine

class MarbleViewState: ObservableObject {

    private var generator: ([SequancePublisher], SequnceScheduler) -> SequanceEqperimentRunner
    private var cancellable: Cancellable?

    @Published var input: [[TimedEvent]] {
        didSet {
            update()
        }
    }

    @Published var output: [TimedEvent] = []

    init(input: [[TimedEvent]], generator: @escaping ([SequancePublisher], SequnceScheduler) -> SequanceEqperimentRunner) {
        self.input = input
        self.generator = generator
    }

    func update() {

        let scheduler = SequnceScheduler()

        cancellable = generator(self.input.map { SequancePublisher(events: $0, scheduler: scheduler) }, scheduler)
            .run(scheduler: scheduler)
            .receive(on: RunLoop.main)
            .assign(to: \.output, on: self)
    }
}

extension TupleOperator {

    var state: MarbleViewState {

        return MarbleViewState(
            input: [input1, input2],
            generator: { publisher, _ in

                
                let combined = self.operation(publisher[0], publisher[1])
                return SequanceExperiment(publisher: combined)
            }
        )
    }
}

extension SingleOperator {

    var state: MarbleViewState {

        return MarbleViewState(
            input: [input],
            generator: { publisher, scheduler in
                let combined = self.operation(publisher[0], scheduler)
                return SequanceExperiment(publisher: combined)
            }
        )
    }
}

struct MarblesScreen: View {

    @ObservedObject var state: MarbleViewState
    @Environment(\.navigator) var navigator: WebNavigator?

    let operation: Operator

    init(operation: Operator) {
        self.operation = operation
        state = operation.state
    }

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<state.input.count) {
                MarbleLane(pos: self.$state.input[$0], isDraggable: true)
                    .frame(height: 44)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
            }

            Text(operation.description)
                .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                .font(Font.custom("Menlo", size: 16))

            MarbleLane(pos: $state.output, isDraggable: false)
                .frame(height: 44)
            Button(action: {
                self.navigator?.gotoWebView(url: self.operation.documentationURL)
            }, label: { Text("Documentation for \(self.operation.name) at Apple") })
            Spacer()
        }
        .padding()
        .navigationBarTitle(operation.name)
        .onAppear { self.state.update() }
    }
}

//#if DEBUG
//struct MarblesScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MarblesScreen()
//    }
//}
//#endif
