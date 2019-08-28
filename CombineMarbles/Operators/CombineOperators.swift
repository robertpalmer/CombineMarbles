import Foundation
import Combine

extension OperatorCollection {

    static var combine = OperatorCollection(
        name: "Combining Elements from Multiple Publishers",
        operators: [
            TupleOperator<String> (
                name: "combineLatest()",
                description: "first.combineLatest(second)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3333679-combinelatest",
                operation: { $0.combineLatest($1).map { $0 + $1 }.eraseToAnyPublisher() },
                input1: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(70)
                ],
                input2: [
                    .next(60, "1"),
                    .finished(80)
                ]
            ),
            TupleOperator<String> (
                name: "merge()",
                description: "first.merge(second)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204724-merge",
                operation: { $0.merge(with: $1).eraseToAnyPublisher() },
                input1: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .next(30, "C"),
                    .next(40, "D"),
                    .next(50, "E"),
                    .next(60, "F"),
                    .finished(70)
                ],
                input2: [.next(25, "1"), .next(75, "2"), .finished(100)]
            ),
            TupleOperator<String> (
                name: "zip()",
                description: "first.zip(second)",
                documentationURL: "https://developer.apple.com/documentation/combine/publisher/3204779-zip",
                operation: { $0.zip($1).map { $0 + $1 }.eraseToAnyPublisher() },
                input1: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(70)
                ],
                input2: [
                    .next(10, "1"),
                    .next(40, "2"),
                    .finished(70)
                ]
            )
        ]
    )
}
