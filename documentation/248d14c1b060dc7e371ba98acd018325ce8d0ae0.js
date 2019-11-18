{
    "function": "tryAllSatisfy(_:)",
    "description": "Publishes a single Boolean value that indicates whether all received elements pass a given error-throwing predicate.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that evaluates each received element. Return true to continue, or false to cancel the upstream and complete. The closure may throw, in which case the publisher cancels the upstream publisher and fails with the thrown error."
        }
    ],
    "return": "A publisher that publishes a Boolean value that indicates whether all received elements pass a given predicate."
}