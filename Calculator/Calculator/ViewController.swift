import UIKit

class ViewController: UIViewController {
    private let stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame = view.bounds
    }

    private func setupStackView() {
        view.addSubview(stackView)
    }
}

#Preview {
    ViewController()
}
