{
    "function": "debounce(for:scheduler:options:)",
    "description": "Publishes elements only after a specified time interval elapses between events.",
    "params": [
        {
            "terms": "dueTime",
            "description": "The time the publisher should wait before publishing an element."
        },
        {
            "terms": "scheduler",
            "description": "The scheduler on which this publisher delivers elements"
        },
        {
            "terms": "options",
            "description": "Scheduler options that customize this publisher’s delivery of elements."
        }
    ],
    "return": "A publisher that publishes events only after a specified time elapses."
}