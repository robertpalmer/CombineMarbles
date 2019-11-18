{
    "function": "delay(for:tolerance:scheduler:options:)",
    "description": "Delays delivery of all output to the downstream receiver by a specified amount of time on a particular scheduler.",
    "params": [
        {
            "terms": "interval",
            "description": "The amount of time to delay."
        },
        {
            "terms": "tolerance",
            "description": "The allowed tolerance in firing delayed events."
        },
        {
            "terms": "scheduler",
            "description": "The scheduler to deliver the delayed events."
        },
        {
            "terms": "options",
            "description": "Options relevant to the scheduler’s behavior."
        }
    ],
    "return": "A publisher that delays delivery of elements and completion to the downstream receiver."
}