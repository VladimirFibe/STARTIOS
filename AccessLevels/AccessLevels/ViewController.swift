import UIKit
import FrameworkTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let laptop = Laptop()
        laptop.addChargeCycle()

        let testClas = TestClass()
    }
}

class ChildeTest: TestClass {
    
}
