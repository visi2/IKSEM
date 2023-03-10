import UIKit

final class BluetoothVC: UIViewController {
    // MARK: - Visual Components
    
    private var bluetoothView: BluetoothView { return self.view as! BluetoothView}
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = BluetoothView()
    }
}

