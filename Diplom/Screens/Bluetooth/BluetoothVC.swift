import UIKit


protocol BluetoothViewControllerOutput: AnyObject {
    func searchPeripheral()
    func disconnectPeripheral()
    func clearListOfPeripherals()
    func setupPresenter(viewController: UIViewController)
}




final class BluetoothVC: UIViewController {
    // MARK: - Visual Components
    
    private var bluetoothView: BluetoothView { return self.view as! BluetoothView}
    private var presenter: BluetoothViewControllerOutput?
    
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
    
    //MARK: - Actions
    
    @objc  func searchPeripheral() {
        setupPresenter(viewController: self)
        presenter?.searchPeripheral()
    }

    @objc  func disconnectPeripheral() {
        presenter?.disconnectPeripheral()
    }
    
    @objc  func clearListOfPeripheral() {
        presenter?.clearListOfPeripherals()
    }
    
    func setupPresenter(viewController: UIViewController) {
        presenter?.setupPresenter(viewController: viewController)
    }
}
