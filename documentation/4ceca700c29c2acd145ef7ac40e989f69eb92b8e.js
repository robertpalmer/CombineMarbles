{
    "function": "tryPrefix(while:)",
    "description": "Republishes elements while a error-throwing predicate closure indicates publishing should continue.",
    "params": [
        {
            "terms": "predicate",
            "description": "A closure that takes an element as its parameter and returns a Boolean value indicating whether publishing should continue."
        }
    ],
    "return": "A publisher that passes through elements until the predicate throws or indicates publishing should finish."
}