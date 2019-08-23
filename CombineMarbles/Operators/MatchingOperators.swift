import Foundation

extension OperatorCollection {

    static var matching = OperatorCollection(
        name: "Applying Matching Criteria to Elements",
        operators: [
            SingleOperator<String> (
                name: "contains()",
                description: "publisher.contains(2)",
                operation: { $0
                    .compactMap { Int($0) }
                    .contains(2)
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "contains(where:)",
                description: "publisher.contains(where: { $0 == 2})",
                operation: { $0
                    .compactMap { Int($0) }
                    .contains(where: { $0 == 2})
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryContains(where:)",
                description: "publisher.tryContains(where: { $0 == 2})",
                operation: { $0
                    .compactMap { Int($0) }
                    .contains(where: { $0 == 2})
                    .map { "\($0)" }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "allSatisfy(_:)",
                description: "publisher.allSatisfy({ $0 < 3})",
                operation: { $0
                    .compactMap { Int($0) }
                    .allSatisfy({ $0 < 3})
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "traAllSatisfy(_:)",
                description: "publisher.tryAllSatisfy({ $0 < 3})",
                operation: { $0
                    .compactMap { Int($0) }
                    .tryAllSatisfy({ $0 < 3})
                    .map { "\($0)" }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
        ]
    )
}
