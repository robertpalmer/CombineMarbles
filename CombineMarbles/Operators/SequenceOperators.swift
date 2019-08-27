import Foundation


extension OperatorCollection {

    static var sequence = OperatorCollection(
        name: "Applying Sequence Operations to Elements",
        operators: [
            TupleOperator<String> (
                name: "drop(untilOutputFrom:)",
                description: "first.drop(untilOutputFrom: second)",
                operation: { $0.drop(untilOutputFrom: $1).eraseToAnyPublisher() },
                input1: TimedEvent.defaultLatters,
                input2: [ .next(40, "1"), .finished(70) ]
            ),
            SingleOperator<String> (
                name: "drop(while:)",
                description: "publisher.drop(while: {$0 < 3 })",
                operation: { pub, _ in pub
                    .compactMap { Int($0) }
                    .drop(while: {$0 < 3 })
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "dropFirst(Int)",
                description: "publisher.dropFirst(3)",
                operation: { pub, _ in pub
                    .dropFirst(3)
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "append()",
                description: "publisher.append(\"1\")",
                operation: { pub, _ in pub.append("1").eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(40)
                ]
            ),
            TupleOperator<String> (
                name: "append<P>(P)",
                description: "first.append(second)",
                operation: { $0.append($1).eraseToAnyPublisher() },
                input1: [.next(20, "A"), .next(30, "B"), .next(40, "C"), .next(50, "D"), .finished(60)],
                input2: [ .next(80, "1"), .next(90, "2"), .finished(99) ]
            ),
            SingleOperator<String> (
                name: "prepend()",
                description: "publisher.prepend(\"1\")",
                operation: { pub, _ in pub.prepend("1").eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(40)
                ]
            ),
            TupleOperator<String> (
                name: "prepend<P>(P)",
                description: "first.prepend(second)",
                operation: { $0.prepend($1).eraseToAnyPublisher() },
                input1: [.next(30, "A"), .next(40, "B"), .next(50, "C"), .next(60, "D"), .finished(70)],
                input2: [ .next(10, "1"), .next(20, "2"), .finished(25) ]
            ),

            TupleOperator<String> (
                name: "prefix(untilOutputFrom:)",
                description: "first.prefix(untilOutputFrom: second)",
                operation: { $0.prefix(untilOutputFrom: $1).eraseToAnyPublisher() },
                input1: TimedEvent.defaultLatters,
                input2: [ .next(40, "1"), .finished(70) ]
            ),
            SingleOperator<String> (
                name: "prefix(while:)",
                description: "publisher.prefix(while: {$0 < 3 })",
                operation: { pub, _ in pub
                    .compactMap { Int($0) }
                    .prefix(while: {$0 < 3 })
                    .map { String($0) }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "prefix(Int)",
                description: "publisher.prefix(3)",
                operation: { pub, _ in pub
                    .prefix(3)
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),
            SingleOperator<String> (
                name: "tryPrefix(while:)",
                description: "publisher.tryPrefix(while: {$0 < 3 })",
                operation: { pub, _ in pub
                    .compactMap { Int($0) }
                    .prefix(while: {$0 < 3 })
                    .map { String($0) }
                    .mapError { _ in FailureString(content: "") }
                    .eraseToAnyPublisher() },
                input: TimedEvent.defaultNumbers
            ),

        ]
    )
}
