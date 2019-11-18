{
    "function": "merge(with:)",
    "description": "Combines elements from this publisher with those from another publisher of the same type, delivering an interleaved sequence of elements.",
    "params": [
        {
            "terms": "other",
            "description": "Another publisher of this publisher’s type."
        }
    ],
    "return": "A publisher that emits an event when either upstream publisher emits an event."
}