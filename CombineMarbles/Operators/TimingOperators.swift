import Foundation

extension OperatorCollection {

    static var timing = OperatorCollection(
        name: "Controlling Timing",
        operators: [
            SingleOperator<String> (
                name: "measureInterval(using:)",
                description: "publisher.measureInterval(using: scheduler)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204722-measureinterval",
                operation: { pub, scheduler in
                    pub
                    .measureInterval(using: scheduler)
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "debounce(for:)",
                description: "publisher.debounce(for: .milliseconds(200), scheduler: scheduler)", documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204702-debounce",
                operation: { pub, scheduler in pub
                    .debounce(for: .milliseconds(30), scheduler: scheduler)
                    .eraseToAnyPublisher() },
                input: [.next(10, "A"), .next(20, "B"), .next(55, "C"), .finished(90)]
            ),
            SingleOperator<String> (
                name: "delay(for:scheduler:)",
                description: "publisher.delay(for: .milliseconds(10), scheduler: scheduler)", documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204704-delay",
                operation: { pub, scheduler in pub
                    .delay(for: .milliseconds(10), scheduler: scheduler)
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "throttle(for:scheduler:latest:)",
                description: "publisher.throttle(for: .milliseconds(30), scheduler: scheduler, latest: false)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204760-throttle",
                operation: { pub, scheduler in pub
                    .throttle(for: .milliseconds(30), scheduler: scheduler, latest: true)
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "timeout(_:scheduler:)",
                description: "publisher.timeout(.milliseconds(30), scheduler: scheduler)", documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204761-timeout",
                operation: { pub, scheduler in pub
                    .timeout(.milliseconds(30), scheduler: scheduler)
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}

