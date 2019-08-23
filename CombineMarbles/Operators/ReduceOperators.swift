import Foundation

extension OperatorCollection {

    static var reduce = OperatorCollection(
        name: "Reducing Elements",
        operators: [
            SingleOperator<String> (
                name: "collect()",
                description: "publisher.collect()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204692-collect",
                operation: { $0.collect().map {$0.joined() }.eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(30, "B"),
                    .next(50, "C"),
                    .finished(70)
                ]
            ),
            SingleOperator<String> (
                name: "collect(Int)",
                description: "publisher.collect(2)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204693-collect",
                operation: { $0.collect(2).map {$0.joined() }.eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .next(30, "C"),
                    .next(40, "D"),
                    .next(50, "E"),
                    .next(60, "F"),
                    .next(70, "G"),
                    .finished(90)
                ]
            ),
            SingleOperator<String> (
                name: "ignoreOutput()",
                description: "publisher.ignoreOutput()",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204714-ignoreoutput",
                operation: { $0.ignoreOutput().map { _ in "" }.eraseToAnyPublisher() },
                input: TimedEvent.defaultLatters
            ),
            SingleOperator<String> (
                name: "reduce()",
                description: "publisher.reduce(0) { $0 + $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204744-reduce",
                operation: { $0
                    .compactMap { Int($0) }
                    .reduce(0) { $0 + $1 }
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryReduce()",
                description: "publisher.tryReduce(0) { $0 + $1 }",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204776-tryreduce",
                operation: { $0
                    .compactMap { Int($0) }
                    .tryReduce(0) { $0 + $1 }
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            )
        ]
    )
}
