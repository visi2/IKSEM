import UIKit

final class BluetoothVC: UIViewController {
    
    weak var bluetoothView: BluetoothView?
    
    override func loadView() {
        super.loadView()
        
        view = BluetoothView()
    }
}

