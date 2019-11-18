{
    "function": "replaceError(with:)",
    "description": "Replaces any errors in the stream with the provided element.",
    "params": [
        {
            "terms": "output",
            "description": "An element to emit when the upstream publisher fails."
        }
    ],
    "return": "A publisher that replaces an error from the upstream publisher with the provided output element."
}