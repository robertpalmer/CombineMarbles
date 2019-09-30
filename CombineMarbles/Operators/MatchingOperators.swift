import Foundation

extension OperatorCollection {

    static var matching = OperatorCollection(
        name: "Applying Matching Criteria to Elements",
        operators: [
            SingleOperator<String> (
                name: "contains()",
                description: "publisher.contains(2)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204699-contains",
                operation: { pub, _ in
                    pub.compactMap { Int($0) }
                    .contains(2)
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "contains(where:)",
                description: "publisher.contains(where: { $0 == 2})",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204700-contains",
                operation: { pub, _ in pub
                    .compactMap { Int($0) }
                    .contains(where: { $0 == 2})
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryContains(where:)",
                description: "publisher.tryContains(where: { $0 == 2})",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204767-trycontains",
                operation: { pub, _ in pub
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
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204682-allsatisfy",
                operation: { pub, _ in pub
                    .compactMap { Int($0) }
                    .allSatisfy({ $0 < 3})
                    .map { "\($0)" }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryAllSatisfy(_:)",
                description: "publisher.tryAllSatisfy({ $0 < 3})",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204762-tryallsatisfy",
                operation: { pub, _ in pub
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
