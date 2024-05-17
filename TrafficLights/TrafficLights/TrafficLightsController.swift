import UIKit

final class TrafficLightsController: UIViewController {
    private var currentIndex: Int? = nil {didSet {self.updateLights()}}

    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.axis = .vertical
        $0.spacing = 10
        return $0
    }(UIStackView())

    private let actionButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "START"
        $0.configuration = config
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.addSubview(actionButton)

        let colors: [UIColor] = [.systemRed, .systemYellow, .systemGreen]
        colors.forEach {
            let circleView = UIView()
            circleView.backgroundColor = $0
            circleView.alpha = 0.3
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor).isActive = true
            stackView.addArrangedSubview(circleView)
        }
        
        actionButton.addAction(UIAction(handler: lightHandler), for: .primaryActionTriggered)
        setupContstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stackView.arrangedSubviews.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
        }
    }

    private func setupContstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func updateLights() {
        guard var activeView = currentIndex else { return }
        if activeView == 3 { activeView = 1 }
        for (index, lightView) in stackView.arrangedSubviews.enumerated() {
            lightView.alpha = index == activeView ? 1 : 0.3
        }
    }

    private func lightHandler(_ action: UIAction) {
        if let index = currentIndex {
            currentIndex = (index + 1) % 4
        } else {
            actionButton.configuration?.title = "NEXT"
            currentIndex = 0
        }
    }
}

#Preview {
    TrafficLightsController()
}
