import UIKit

final class WelcomeViewController: UIViewController {
    var name = ""
    @IBOutlet weak var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if !name.isEmpty {
            welcomeLabel.text = "Welcome, \(name)!"
        }
    }
}
