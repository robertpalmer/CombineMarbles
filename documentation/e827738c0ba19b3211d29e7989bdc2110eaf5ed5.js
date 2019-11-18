{
    "function": "reduce(_:_:)",
    "description": "Applies a closure that accumulates each element of a stream and publishes a final result upon completion.",
    "params": [
        {
            "terms": "initialResult",
            "description": "The value the closure receives the first time it is called."
        },
        {
            "terms": "nextPartialResult",
            "description": "A closure that takes the previously-accumulated value and the next element from the upstream publisher to produce a new value."
        }
    ],
    "return": "A publisher that applies the closure to all received elements and produces an accumulated value when the upstream publisher finishes."
}