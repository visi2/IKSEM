import Foundation

class BluetoothPresenter {
    
    private var bluetoothManager = BluetoothManager()
    weak var bluetoothView = BluetoothTableView()
    
    //MARK: - Init
    init() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BluetoothPresenter: BluetoothViewControllerOutput {
    func searchPeripheral() {
        bluetoothManager.searchPeripheral()
    }
    
    func disconnectPeripheral() {
        bluetoothManager.disconnectPeripheral()
    }
    
    func clearListOfPeripherals() {
        bluetoothManager.sendToPeripheral(text: "1")
    }
}
