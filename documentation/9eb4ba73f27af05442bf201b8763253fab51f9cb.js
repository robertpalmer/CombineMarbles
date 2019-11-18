{
    "function": "combineLatest(_:_:)",
    "description": "Subscribes to an additional publisher and invokes a closure upon receiving output from either publisher.",
    "params": [
        {
            "terms": "other",
            "description": "Another publisher to combine with this one."
        },
        {
            "terms": "transform",
            "description": "A closure that receives the most recent value from each publisher and returns a new value to publish."
        }
    ],
    "return": "A publisher that receives and combines elements from this and another publisher."
}