import Foundation
import Combine

protocol SequanceEqperimentRunner {
    func run(scheduler: SequnceScheduler) -> Future<[TimedEvent], Never>
}

struct SequanceExperiment<P: Publisher>: SequanceEqperimentRunner where P.Failure == FailureString, P.Output == String {

    let publisher: P

    func run(scheduler: SequnceScheduler) -> Future<[TimedEvent], Never>  {

        return Future { callback in
            var cancellable: Cancellable?
            var collected = [TimedEvent]()

            cancellable = self.publisher
                .sink(receiveCompletion: { result in
                    let time = Int(scheduler.now.value / 1000 / 1000)
                    switch result {
                    case .finished:
                        collected.append(.finished(time))
                    case let .failure(failure):
                        collected.append(.error(time, failure.content))
                    }

                    callback(.success(collected))

                    if cancellable != nil {
                        cancellable = nil
                    }
                }, receiveValue: {
                    collected.append(.next(Int(scheduler.now.value / 1000 / 1000), $0))
                })

            scheduler.start()
        }
    }
}
