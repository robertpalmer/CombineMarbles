import Foundation
import SafariServices

class WebNavigator {

    weak var rootViewController: UIViewController?

    func gotoWebView(url: String) {

        guard let url = URL(string: url) else { return }
        let viewController = SFSafariViewController(url: url)

        rootViewController?.present(viewController, animated: true, completion: nil)
    }
}
