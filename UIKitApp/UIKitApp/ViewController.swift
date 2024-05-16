import UIKit

class ViewController: UIViewController {
    private let segmentCell = SegmentCell()
    private var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentCell()
        setupTableView()
    }

    func setupSegmentCell() {
        segmentCell.configure(target: self, action: #selector(segmentedControlAction))
    }

    @objc func segmentedControlAction(_ segmentedControl: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupFrameAndBoundsView() {
        let frameAndBoundsView = UIView(frame: CGRect(x: 10, y: 200, width: 300, height: 200))
        view.addSubview(frameAndBoundsView)
        frameAndBoundsView.backgroundColor = .red
        frameAndBoundsView.transform = CGAffineTransform(rotationAngle: 2)
        print("frame: ", frameAndBoundsView.frame, "bounds: ", frameAndBoundsView.bounds)
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: return segmentCell
        default: return UITableViewCell()
        }
    }
    

}


class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



@objc extension BaseTableViewCell {
    func setupViews() {}
    func setupConstraints() {}
}

#Preview {
    ViewController()
}
