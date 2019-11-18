{
    "function": "tryContains(where:)",
    "description": "Publishes a Boolean value upon receiving an element that satisfies the throwing predicate closure.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that takes an element as its parameter and returns a Boolean value indicating whether the element satisfies the closure’s comparison logic."
        }
    ],
    "return": "A publisher that emits the Boolean value true when the upstream publisher emits a matching value."
}