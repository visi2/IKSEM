import UIKit


protocol BluetoothViewControllerOutput {
    func searchPeripheral()
    func disconnectPeripheral()
    func clearListOfPeripherals()
}


final class BluetoothVC: UIViewController {
    // MARK: - Visual Components
    
    private var bluetoothView: BluetoothView { return self.view as! BluetoothView}
    private var presenter: BluetoothPresenter?
    
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = BluetoothPresenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = BluetoothView()
    }
    
    @objc  func searchPeripheral() {
        presenter?.searchPeripheral()
    }

    @objc  func disconnectPeripheral() {
        presenter?.disconnectPeripheral()
    }
    
    @objc  func clearListOfPeripheral() {
        presenter?.clearListOfPeripherals()
    }

}


