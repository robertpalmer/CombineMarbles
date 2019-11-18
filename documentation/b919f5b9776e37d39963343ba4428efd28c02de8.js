{
    "function": "collect(_:)",
    "description": "Collects up to the specified number of elements, and then emits a single array of the collection.",
    "params": [
        {
            "terms": "count",
            "description": "The maximum number of received elements to buffer before publishing."
        }
    ],
    "return": "A publisher that collects up to the specified number of elements, and then publishes them as an array."
}