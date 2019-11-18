{
    "function": "tryFilter(_:)",
    "description": "Republishes all elements that match a provided error-throwing closure.",
    "params": [
        {
            "terms": "isIncluded",
            "description": "A closure that takes one element and returns a Boolean value indicating whether to republish the element."
        }
    ],
    "return": "A publisher that republishes all elements that satisfy the closure."
}