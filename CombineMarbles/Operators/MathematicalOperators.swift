import Foundation

extension OperatorCollection {

    static var mathematical = OperatorCollection(
        name: "Applying Mathematical Operations on Elements",
        operators: [
            SingleOperator<String> (
                name: "count()",
                description: "publisher.count()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204701-count",
                operation: { pub, _ in pub.count().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultLatters
            ),
            SingleOperator<String> (
                name: "max()",
                description: "publisher.max()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { pub, _ in pub.max().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "max(by:)",
                description: "publisher.max { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { pub, _ in pub.max { $0 < $1 }.map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryMax(by:)",
                description: "publisher.tryMax { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204720-max",
                operation: { pub, _ in pub
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
                operation: { pub, _ in pub.min().map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "min(by:)",
                description: "publisher.min { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204732-min",
                operation: { pub, _ in pub.min { $0 < $1 }.map { String($0) }.eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryMin(by: )",
                description: "publisher.tryMin { $0 < $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204774-trymin",
                operation: { pub, _ in pub.tryMin { $0 < $1 }
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}
