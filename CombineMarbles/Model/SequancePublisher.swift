import Foundation
import Combine

struct FailureString: Error, Equatable {
    let content: String
}

struct SequancePublisher: Publisher {

    private let events: [TimedEvent]
    private let scheduler: SequnceScheduler

    init(events: [TimedEvent], scheduler: SequnceScheduler) {
        self.events = events
        self.scheduler = scheduler
    }

    func receive<Sub>(subscriber: Sub) where Sub : Subscriber, Failure == Sub.Failure, Sub.Input == Output {

        let subscription = SequanceSubscription<Sub>(events: events, subscriber: subscriber, scheduler: scheduler)
        subscriber.receive(subscription: subscription)
    }

    typealias Output = String
    typealias Failure = FailureString

    private class SequanceSubscription<S>: Subscription where S : Subscriber, Failure == S.Failure, S.Input == Output {

        var subscriber: S?
        let scheduler: SequnceScheduler
        let events: [TimedEvent]
        var emitted: Int = 0

        init(events: [TimedEvent], subscriber: S, scheduler: SequnceScheduler) {
            self.events = events
            self.subscriber = subscriber
            self.scheduler = scheduler
        }

        func cancel() {
            subscriber = nil
        }

        func request(_ demand: Subscribers.Demand) {

            if let last = events.last, scheduler.now.distance(to: .milliseconds(last.timeInterval)) < 0 {
                subscriber?.receive(completion: .finished)
                return
            }

            let requested = demand.max.map { emitted + $0 } ?? events.count
            guard requested <= events.count else { return }

            events[emitted..<requested].forEach { event in

                self.scheduler.schedule(after: .milliseconds(event.timeInterval)) { [weak self] in
                    switch event.type {
                    case .next:
                        _ = self?.subscriber?.receive(event.content!)
                    case .finished:
                        self?.subscriber?.receive(completion: .finished)
                    case .error:
                        self?.subscriber?.receive(completion: .failure(FailureString(content: "")))
                    }
                }
            }

            emitted = requested
        }
    }
}
