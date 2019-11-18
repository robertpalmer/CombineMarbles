{
    "function": "tryMin(by:)",
    "description": "Publishes the minimum value received from the upstream publisher, using the provided error-throwing closure to order the items.",
    "params": [
        {
            "terms": "areInIncreasingOrder",
            "description": "A throwing closure that receives two elements and returns true if they are in increasing order. If this closure throws, the publisher terminates with a Failure."
        }
    ],
    "return": "A publisher that publishes the minimum value received from the upstream publisher, after the upstream publisher finishes."
}