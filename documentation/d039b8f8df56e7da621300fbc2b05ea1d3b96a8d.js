{
    "function": "measureInterval(using:options:)",
    "description": "Measures and emits the time interval between events received from an upstream publisher.",
    "params": [
        {
            "terms": "scheduler",
            "description": "A scheduler to use for tracking the timing of events."
        },
        {
            "terms": "options",
            "description": "Options that customize the delivery of elements."
        }
    ],
    "return": "A publisher that emits elements representing the time interval between the elements it receives."
}