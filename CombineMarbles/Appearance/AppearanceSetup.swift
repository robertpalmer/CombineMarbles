import UIKit

struct Appearance {

    static func setup() {

        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = UIColor(named: "navigationBarColor")
        barAppearance.titleTextAttributes = [.font: UIFont(name: "Avenir-Black", size: 20)!]
        barAppearance.largeTitleTextAttributes = [.font: UIFont(name: "Avenir-Black", size: 30)!]

        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().tintColor = UIColor(named: "action")
    }
}
