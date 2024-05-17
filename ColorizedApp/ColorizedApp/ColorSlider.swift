import UIKit

final class ColorSlider: UIView {
    private let color: UIColor
    private lazy var leftLabel: UILabel = {
        $0.text = "0"
        $0.textColor = color
        return $0
    }(UILabel())
    private lazy var slider: UISlider = {
        $0.value = 0.5
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.thumbTintColor = color
        $0.minimumTrackTintColor = color
        return $0
    }(UISlider())
    private lazy var rightLabel: UILabel = {
        $0.text = "255"
        $0.textColor = color
        return $0
    }(UILabel())
    private lazy var stackView: UIStackView = {
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView(arrangedSubviews: [leftLabel, slider, rightLabel]))
    var value: CGFloat {
        CGFloat(slider.value)
    }

    init(color: UIColor = .red) {
        self.color = color
        super.init(frame: .zero)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(target: Any?, action: Selector) {
        slider.addTarget(target, action: action, for: .valueChanged)
    }
}

#Preview {
    ViewController()
}
