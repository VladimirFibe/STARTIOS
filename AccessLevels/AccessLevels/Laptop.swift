import Foundation

class Laptop {
    private var chargeCycleCount = 0

    func addChargeCycle() {
        chargeCycleCount += 1
    }

    var countChargeCycle: Int { chargeCycleCount}

    func getChargeCycleCount() -> Int { chargeCycleCount }
}
