import Foundation
import CoreBluetooth

class BluetoothPresenter {
    
    private var bluetoothManager: BluetoothManager?
    private var peripheal: CBPeripheral?
    
    //MARK: - Init
    init() {
        self.bluetoothManager = BluetoothManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BluetoothPresenter: BluetoothViewOutput {
    func search() {
        BluetoothManager.sharedInstance.manager?.scanForPeripherals(withServices: nil)
    }

    func send() {
        BluetoothManager.sharedInstance.send(text: "1")
    }
}
