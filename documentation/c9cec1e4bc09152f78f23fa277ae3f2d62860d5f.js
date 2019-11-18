{
    "function": "drop(untilOutputFrom:)",
    "description": "Ignores elements from the upstream publisher until it receives an element from a second publisher.",
    "params": [
        {
            "terms": "publisher",
            "description": "A publisher to monitor for its first emitted element."
        }
    ],
    "return": "A publisher that drops elements from the upstream publisher until the other publisher produces a value."
}