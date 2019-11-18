{
    "function": "throttle(for:scheduler:latest:)",
    "description": "Publishes either the most-recent or first element published by the upstream publisher in the specified time interval.",
    "params": [
        {
            "terms": "interval",
            "description": "The interval at which to find and emit the most recent element, expressed in the time system of the scheduler."
        },
        {
            "terms": "scheduler",
            "description": "The scheduler on which to publish elements."
        },
        {
            "terms": "latest",
            "description": "A Boolean value that indicates whether to publish the most recent element. If false, the publisher emits the first element received during the interval."
        }
    ],
    "return": "A publisher that emits either the most-recent or first element received during the specified interval."
}