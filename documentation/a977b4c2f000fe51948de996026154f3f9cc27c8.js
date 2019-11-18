{
    "function": "contains(_:)",
    "description": "Publishes a Boolean value upon receiving an element equal to the argument.",
    "params": [
        {
            "terms": "output",
            "description": "An element to match against."
        }
    ],
    "return": "A publisher that emits the Boolean value true when the upstream publisher emits a matching value."
}