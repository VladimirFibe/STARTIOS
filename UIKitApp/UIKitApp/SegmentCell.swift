import UIKit

class SegmentCell: BaseTableViewCell {
    static let identifier = "SegmentCell"
    private let segmentedControl = UISegmentedControl()
    override func setupViews() {
        contentView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "One", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: true)
        segmentedControl.selectedSegmentIndex = 0
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(target: Any?, action: Selector) {
        segmentedControl.addTarget(target, action: action, for: .valueChanged)
    }
}

#Preview {
    SegmentCell()
}
