import UIKit

class ViewController: UIViewController {
    private var rTarget = 0.0
    private var gTarget = 0.0
    private var bTarget = 0.0

    private var rightColor: UIColor {
        UIColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: 1.0)
    }
    private var rightLabel: String {
        "R: \(Int(redSlider.value * 255.0)) " +
        "G: \(Int(greenSlider.value * 255.0)) " +
        "B: \(Int(blueSlider.value * 255.0))"
    }

    private let leftView = ColorView()
    private let rightView = ColorView()
    private let hitMeButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Hit Me"
        $0.configuration = config
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    }(UIButton(type: .system))

    private let redSlider = ColorSlider(color: .systemRed)
    private let greenSlider = ColorSlider(color: .systemGreen)
    private let blueSlider = ColorSlider(color: .systemBlue)
    private var stackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private var computeScore: Int {
        let rDiff = redSlider.value - rTarget
        let gDiff = greenSlider.value - gTarget
        let bDiff = blueSlider.value - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTargetColors()
        rightView.configure(with: rightLabel, color: rightColor)
        hitMeButton.addTarget(self, action: #selector(hitMeAction), for: .primaryActionTriggered)
        redSlider.configure(target: self, action: #selector(sliderAction))
        greenSlider.configure(target: self, action: #selector(sliderAction))
        blueSlider.configure(target: self, action: #selector(sliderAction))
        setupStackView()
    }

    private func setupStackView() {
        let topStackView = UIStackView(arrangedSubviews: [leftView, rightView])
        topStackView.distribution = .fillEqually
        topStackView.spacing = 10
        view.addSubview(stackView)
        [topStackView, hitMeButton, redSlider, greenSlider, blueSlider].forEach {
            stackView.addArrangedSubview($0)
        }
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }

    @objc private func sliderAction(_ sender: UISlider) {
        rightView.configure(with: rightLabel, color: rightColor)
    }

    @objc private func hitMeAction() {
        let message = "Target Color:\n" +
        "R: \(Int(rTarget * 255.0))\n" +
        "G: \(Int(gTarget * 255.0))\n" +
        "B: \(Int(bTarget * 255.0))"
        showAlert(with: "Your score: \(computeScore)", and: message)
    }

    func resetTargetColors() {
        rTarget = Double.random(in: 0..<1)
        gTarget = Double.random(in: 0..<1)
        bTarget = Double.random(in: 0..<1)
        leftView.configure(
            with: "Match this color",
            color: UIColor(red: rTarget, green: gTarget, blue: bTarget, alpha: 1.0)
        )
    }

    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.resetTargetColors()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

#Preview {
    ViewController()
}
