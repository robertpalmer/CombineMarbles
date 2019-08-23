import Foundation

enum EventType: Equatable {
    case next
    case finished
    case error
}

struct TimedEvent: Equatable, Identifiable {

    var timeInterval: Int
    let content: String?
    let type: EventType

    let id = UUID()
}

extension TimedEvent {

    static func next(_ time: Int, _ content: String) -> TimedEvent {
        return TimedEvent(timeInterval: time, content: content, type: .next)
    }

    static func finished(_ time: Int) -> TimedEvent {
        return TimedEvent(timeInterval: time, content: nil, type: .finished)
    }

    static func error(_ time: Int, _ content: String) -> TimedEvent {
        return TimedEvent(timeInterval: time, content: content, type: .error)
    }
}
