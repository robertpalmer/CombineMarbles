{
    "function": "tryScan(_:_:)",
    "description": "Transforms elements from the upstream publisher by providing the current element to an error-throwing closure along with the last value returned by the closure.",
    "params": [
        {
            "terms": "initialResult",
            "description": "The previous result returned by the nextPartialResult closure."
        },
        {
            "terms": "nextPartialResult",
            "description": "An error-throwing closure that takes as its arguments the previous value returned by the closure and the next element emitted from the upstream publisher."
        }
    ],
    "return": "A publisher that transforms elements by applying a closure that receives its previous return value and the next element from the upstream publisher."
}