import UIKit

class ViewController: UIViewController {
    private let stackView = UIStackView()
    private let displayLabel = UILabel()
    private let spacing = 14.0
    private var buttonZero: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame = view.layoutMarginsGuide.layoutFrame

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        buttonZero.configuration?.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: buttonZero.frame.height + 4)
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.addArrangedSubview(UIView())
        setupDisplayLabel()
        stackView.addArrangedSubview(makeStack(with: makeViews(with: ["AC", "±", "%", "÷"])))
        stackView.addArrangedSubview(makeStack(with: makeViews(with: ["7", "8", "9", "×"])))
        stackView.addArrangedSubview(makeStack(with: makeViews(with: ["4", "5", "6", "-"])))
        stackView.addArrangedSubview(makeStack(with: makeViews(with: ["1", "2", "3", "+"])))
        stackView.addArrangedSubview(makeStack(with: [makeButton(with: "0"), makeStack(with: makeViews(with: [".", "="]))]))
    }

    private func makeViews(with titles: [String]) -> [UIView] {
        titles.map { makeButton(with: $0)}
    }

    private func makeStack(with views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.spacing = spacing
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }

    private func makeButton(with text: String) -> UIButton {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        var attText = AttributedString(text)
        attText.font = .systemFont(ofSize: 40, weight: .semibold)
        config.attributedTitle = attText
        config.baseBackgroundColor = .systemFill
        config.baseForegroundColor = .label
        config.cornerStyle = .capsule
        button.configuration = config
        if text != "0" {
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        } else {
            buttonZero = button
        }
        button.addAction(UIAction(handler: { _ in
            self.touchDigit(text)
        }), for: .primaryActionTriggered)
        return button
    }

    private func setupDisplayLabel() {
        stackView.addArrangedSubview(displayLabel)
        let font = UIFont.systemFont(ofSize: 90, weight: .light)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tailIndent = -20
        paragraphStyle.alignment = .right
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.label,
            .paragraphStyle: paragraphStyle
        ]
        displayLabel.attributedText = NSAttributedString(string: "941", attributes: attributes)
    }

    private func touchDigit(_ text: String) {
        print(text)
    }

    private func performOperation(_ text: String) {
        print("Operation: ", text)
    }

}

@available(iOS 17.0, *)
#Preview {
    ViewController()
}
