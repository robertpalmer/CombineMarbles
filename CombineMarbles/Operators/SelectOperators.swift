import Foundation

extension OperatorCollection {

    static var select = OperatorCollection(
        name: "Selecting Specific Elements",
        operators: [
            SingleOperator<String> (
                name: "first",
                description: "publisher.first()",
                operation: { $0
                    .first()
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "first(where:)",
                description: "publisher.first(where: { $0 > 3 })",
                operation: { $0
                    .compactMap { Int($0)}
                    .first(where: { $0 > 3 })
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryFirst(where:)",
                description: "publisher.tryFirst(where: { $0 > 3 })",
                operation: { $0
                    .compactMap { Int($0)}
                    .tryFirst(where: { $0 > 3 })
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "last",
                description: "publisher.last()",
                operation: { $0
                    .last()
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "last(where:)",
                description: "publisher.last(where: { $0 > 3 })",
                operation: { $0
                    .compactMap { Int($0)}
                    .last(where: { $0 > 1 })
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryLast(where:)",
                description: "publisher.tryLast(where: { $0 > 3 })",
                operation: { $0
                    .compactMap { Int($0)}
                    .tryFirst(where: { $0 > 1 })
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "output(at:)",
                description: "publisher.output(at: 2)",
                operation: { $0
                    .compactMap { Int($0)}
                    .output(at: 2)
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "output<R>(in:)",
                description: "publisher.output(1..<3)",
                operation: { $0
                    .compactMap { Int($0)}
                    .output(in: 1..<3)
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}
