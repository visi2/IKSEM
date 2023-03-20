import Foundation
import UIKit

class BluetoothPresenter {
    
    private var bluetoothManager = BluetoothManager()
    weak var bluetoothVC: BluetoothViewControllerInput?
    
}

extension BluetoothPresenter: BluetoothViewControllerOutput {
    
    
    
    func searchPeripheral() {
        bluetoothManager.searchPeripheral()
        let viewController = ViewController()
        bluetoothVC?.presentTableOfPeripherals(viewController: viewController)
        print("click naxoi")
    }
    
    func disconnectPeripheral() {
        bluetoothManager.disconnectPeripheral()
    }
    
    func clearListOfPeripherals() {
        bluetoothManager.sendToPeripheral(text: "1")
    }
}
