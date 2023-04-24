import UIKit

protocol BluetoothViewControllerOutput: AnyObject {
    func connectPeripheral()
    func disconnectPeripheral()
}


final class BluetoothVC: UIViewController {
    // MARK: - Visual Components
    
    private var bluetoothView: BluetoothView { return self.view as! BluetoothView}
    var presenter: BluetoothViewControllerOutput?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = BluetoothView()
    }
    
    //MARK: - Actions
    
    @objc  func connectPeripheral() {
        presenter?.connectPeripheral()
    }

    @objc  func disconnectPeripheral() {
        presenter?.disconnectPeripheral()
    }
}
