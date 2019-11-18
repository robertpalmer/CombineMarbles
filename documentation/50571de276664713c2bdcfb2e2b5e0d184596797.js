{
    "function": "tryRemoveDuplicates(by:)",
    "description": "Publishes only elements that don’t match the previous element, as evaluated by a provided error-throwing closure.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure to evaluate whether two elements are equivalent, for purposes of filtering. Return true from this closure to indicate that the second element is a duplicate of the first. If this closure throws an error, the publisher terminates with the thrown error."
        }
    ],
    "return": "A publisher that consumes — rather than publishes — duplicate elements."
}