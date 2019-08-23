import Foundation

extension OperatorCollection {

    static var mathematical = OperatorCollection(
        name: "Applying Mathematical Operations on Elements",
        operators: [
            SingleOperator<String> (
                name: "count()",
                description: "publisher.count()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204701-count",
                operation: { $0.count().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultLatters
            ),
            SingleOperator<String> (
                name: "max()",
                description: "publisher.max()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { $0.max().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "max(by:)",
                description: "publisher.max { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { $0.max { $0 < $1 }.map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryMax(by:)",
                description: "publisher.tryMax { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { $0
                    .tryMax { $0 < $1 }
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "min()",
                description: "publisher.min()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204731-min",
                operation: { $0.min().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "min(by:)",
                description: "publisher.min { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204732-min",
                operation: { $0.min { $0 < $1 }.map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryMin(by: )",
                description: "publisher.tryMin { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204774-trymin",
                operation: { $0.tryMin { $0 < $1 }
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}
