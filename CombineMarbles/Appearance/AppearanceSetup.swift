import UIKit

struct Appearance {

    static func setup() {

        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = UIColor(.navigationBarColor)
        barAppearance.titleTextAttributes = [.font: UIFont(name: "Avenir-Black", size: 20)!, .foregroundColor: UIColor(.foreground)]
        barAppearance.largeTitleTextAttributes = [.font: UIFont(name: "Avenir-Black", size: 30)!, .foregroundColor: UIColor(.foreground)]
        
        let buttonAppearence = UIBarButtonItemAppearance(style: .plain)
        buttonAppearence.normal.titleTextAttributes = [.font: UIFont(name: "Avenir-Black", size: 20)!, .foregroundColor: UIColor(.primary)]
    
        barAppearance.buttonAppearance = buttonAppearence
        
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().tintColor = UIColor(.primary)
        
    }
}
