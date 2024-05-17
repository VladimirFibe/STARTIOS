import UIKit

class ViewController: UIViewController {
    private var isDatePickerHidden = false { didSet { self.setupUI()}}
    private let segmentedControl: UISegmentedControl = {
        $0.selectedSegmentIndex = 0
        return $0
    }(UISegmentedControl(items: ["First", "Second"]))

    private let mainLabel: UILabel = {
        $0.text = "Label"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 35)
        $0.numberOfLines = 2
        return $0
    }(UILabel())

    private let slider: UISlider = {
        $0.value = 1
        $0.minimumValue = 0
        $0.maximumValue = 1
        $0.minimumTrackTintColor = .systemYellow
        $0.maximumTrackTintColor = .systemRed
        $0.thumbTintColor = .systemBlue
        return $0
    }(UISlider())

    private let textField: UITextField = {
        $0.placeholder = "Enter your name"
        return $0
    }(UITextField())

    private let doneButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Done"
        $0.configuration = config
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    }(UIButton(type: .system))

    private let hidePickerSwitch: UISwitch = {
        $0.isOn = true
        return $0
    }(UISwitch())

    private let datePicker: UIDatePicker = {
        return $0
    }(UIDatePicker())

    private let switchLabel: UILabel = {
        $0.text = "Hide Date Picker"
        return $0
    }(UILabel())

    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 40
        return $0
    }(UIStackView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        setupContstraints()
        setupStackView()
    }

    private func setupStackView() {
        let switchStack = UIStackView(arrangedSubviews: [switchLabel, hidePickerSwitch])
        [segmentedControl, mainLabel, slider, textField, doneButton, switchStack, datePicker].forEach {
            stackView.addArrangedSubview($0)
        }
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        hidePickerSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        datePicker.addTarget(self, action: #selector(datePickerAction), for: .valueChanged)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .primaryActionTriggered)
    }

    private func setupContstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    @objc func segmentedControlAction(_ segmentedControl: UISegmentedControl) {
        mainLabel.text = "\(segmentedControl.selectedSegmentIndex)"
    }

    @objc func sliderAction() {
        mainLabel.text = "\(slider.value)"
    }

    @objc func switchAction() {
        isDatePickerHidden.toggle()
    }

    @objc private func datePickerAction() {
        mainLabel.text = datePicker.date.formatted(date: .long, time: .shortened)
    }

    @objc private func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Hi", and: "Yes")
            return
        }
        mainLabel.text = inputText
    }

    private func setupUI() {
        datePicker.isHidden = isDatePickerHidden
        switchLabel.text = isDatePickerHidden ? "Show Date Picker" : "Hide Date Picker"
    }

    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

#Preview {
    ViewController()
}
