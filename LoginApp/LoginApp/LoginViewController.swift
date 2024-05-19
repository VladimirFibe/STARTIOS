import UIKit

class LoginViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? WelcomeViewController else { return }
        controller.view.backgroundColor = .red
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        view.backgroundColor = .green
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

