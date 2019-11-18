{
    "function": "min(by:)",
    "description": "Publishes the minimum value received from the upstream publisher, after it finishes.",
    "params": [
        {
            "terms": "areInIncreasingOrder",
            "description": "A closure that receives two elements and returns true if they are in increasing order."
        }
    ],
    "return": "A publisher that publishes the minimum value received from the upstream publisher, after the upstream publisher finishes."
}