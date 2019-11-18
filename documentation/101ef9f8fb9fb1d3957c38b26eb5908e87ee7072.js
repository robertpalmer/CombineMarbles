{
    "function": "tryCompactMap(_:)",
    "description": "Calls an error-throwing closure with each received element and publishes any returned optional that has a value.",
    "params": [
        {
            "terms": "transform",
            "description": "an error-throwing closure that receives a value and returns an optional value."
        }
    ],
    "return": "A publisher that republishes all non-nil results of calling the transform closure."
}