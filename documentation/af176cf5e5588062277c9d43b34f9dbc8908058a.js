{
    "function": "tryMap(_:)",
    "description": "Transforms all elements from the upstream publisher with a provided error-throwing closure.",
    "params": [
        {
            "terms": "transform",
            "description": "A closure that takes one element as its parameter and returns a new element."
        }
    ],
    "return": "A publisher that uses the provided closure to map elements from the upstream publisher to new elements that it then publishes."
}