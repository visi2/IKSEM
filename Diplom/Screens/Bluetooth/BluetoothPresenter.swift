import UIKit

class BluetoothPresenter {
    
    private var bluetoothManager = BluetoothManager()
    
    // MARK: - Public Properties
    weak var viewInput: UIViewController?

    init(view: UIViewController) {
        self.viewInput = view
    }
}

extension BluetoothPresenter: BluetoothViewControllerOutput {
    
    func connectPeripheral() {
        bluetoothManager.connectPeripheral()
    }
    
    func disconnectPeripheral() {
        bluetoothManager.disconnectPeripheral()
    }
}
