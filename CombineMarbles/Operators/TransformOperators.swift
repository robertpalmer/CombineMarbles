import Foundation
import Combine

extension OperatorCollection {

    static var transforms = OperatorCollection(
        name: "transform",
        operators: [
            SingleOperator<String> (
                name: "append",
                description: "publisher.append(\"c\")",
                operation: { pub, _ in pub.append(["c"]).eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(40)
                ]
            ),
            SingleOperator<String> (
                name: "prepand",
                description: "publisher.prepand(\"c\")",
                operation: { pub, _ in pub.prefix(1).eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .finished(40)
                ]
            ),
            SingleOperator<String> (
                name: "output",
                description: "publisher.output(1)",
                operation: { pub, _ in pub.output(at: 1).eraseToAnyPublisher() },
                input: [
                    .next(10, "A"),
                    .next(20, "B"),
                    .next(30, "C"),
                    .finished(40)
                ]
            )
        ]
    )
}
