{
    "function": "tryLast(where:)",
    "description": "Publishes only the last element of a stream that satisfies an error-throwing predicate closure, after the stream finishes.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that takes an element as its parameter and returns a Boolean value that indicates whether to publish the element."
        }
    ],
    "return": "A publisher that only publishes the last element satisfying the given predicate."
}