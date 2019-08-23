import Foundation

extension TimedEvent {
    static var defaultLatters: [TimedEvent] {
        [.next(10, "A"), .next(30, "B"), .next(50, "C"), .next(70, "D"), .finished(90)]
    }

    static var defaultNumbers: [TimedEvent] {
        [.next(10, "1"), .next(30, "2"), .next(50, "3"), .next(70, "4"), .finished(90)]
    }
}

extension OperatorCollection {

    static var map = OperatorCollection(
        name: "Mapping Element",
        operators: [
            SingleOperator<String> (
                name: "map()s",
                description: "publisher.map { \"\\($0)\\($0)\" }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204718-map",
                operation: { $0.map { "\($0)\($0)" }.eraseToAnyPublisher() },
                input: TimedEvent.defaultLatters
            ),
            SingleOperator<String> (
                name: "tryMap()",
                description: "publisher.tryMap { \"\\($0)\\($0)\" }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204772-trymap",
                operation: { $0
                    .tryMap { "\($0)\($0)" }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultLatters
            ),
            SingleOperator<String> (
                name: "scan()",
                description: "publisher.scan(0) { $0 + $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3229094-scan",
                operation: { $0
                    .compactMap { Int($0) }
                    .scan(0) { $0 + $1 }
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryScan()",
                description: "publisher.tryScan(0) { $0 + $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3229095-tryscan",
                operation: { $0
                    .compactMap { Int($0) }
                    .scan(0) { $0 + $1 }
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}
