{
    "function": "first(where:)",
    "description": "Publishes the first element of a stream to satisfy a predicate closure, then finishes.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that takes an element as a parameter and returns a Boolean value that indicates whether to publish the element."
        }
    ],
    "return": "A publisher that only publishes the first element of a stream that satifies the predicate."
}