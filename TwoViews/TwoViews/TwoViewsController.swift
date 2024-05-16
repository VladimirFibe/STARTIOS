import UIKit

final class TwoViewsController: UIViewController {
    private let topView: UIView = {
        $0.backgroundColor = .systemGreen
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let bottomView: UIView = {
        $0.backgroundColor = .systemRed
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topView)
        view.addSubview(bottomView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            topView.heightAnchor.constraint(equalTo: bottomView.heightAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

#Preview {
    TwoViewsController()
}
