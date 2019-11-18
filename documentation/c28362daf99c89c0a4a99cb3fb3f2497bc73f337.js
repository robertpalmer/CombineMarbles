{
    "function": "allSatisfy(_:)",
    "description": "Publishes a single Boolean value that indicates whether all received elements pass a given predicate.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that evaluates each received element. Return true to continue, or false to cancel the upstream and complete."
        }
    ],
    "return": "A publisher that publishes a Boolean value that indicates whether all received elements pass a given predicate."
}