{
    "function": "drop(while:)",
    "description": "Omits elements from the upstream publisher until a given closure returns false, before republishing all remaining elements.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that takes an element as a parameter and returns a Boolean value indicating whether to drop the element from the publisher’s output."
        }
    ],
    "return": "A publisher that skips over elements until the provided closure returns false."
}