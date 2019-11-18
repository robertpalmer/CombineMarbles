{
    "function": "timeout(_:scheduler:options:customError:)",
    "description": "Terminates publishing if the upstream publisher exceeds the specified time interval without producing an element.",
    "params": [
        {
            "terms": "interval",
            "description": "The maximum time interval the publisher can go without emitting an element, expressed in the time system of the scheduler."
        },
        {
            "terms": "scheduler",
            "description": "The scheduler to deliver events on."
        },
        {
            "terms": "options",
            "description": "Scheduler options that customize the delivery of elements."
        },
        {
            "terms": "customError",
            "description": "A closure that executes if the publisher times out. The publisher sends the failure returned by this closure to the subscriber as the reason for termination."
        }
    ],
    "return": "A publisher that terminates if the specified interval elapses with no events received from the upstream publisher."
}