import Foundation
import SwiftUI

struct NavigatorKey: EnvironmentKey {
    static let defaultValue: WebNavigator? = nil
}

extension EnvironmentValues {

    var navigator: WebNavigator? {
        get {
            self[NavigatorKey.self]
        }
        set {
            self[NavigatorKey.self] = newValue
        }
    }
}
