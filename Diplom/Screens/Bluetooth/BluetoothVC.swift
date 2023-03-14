import UIKit


protocol BluetoothVCOutput {
    func search()
    func send()
}


final class BluetoothVC: UIViewController {
    // MARK: - Visual Components
    
    private var bluetoothView: BluetoothView { return self.view as! BluetoothView}
    private var presenter: BluetoothVCOutput?
    
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = BluetoothPresenter() as? any BluetoothVCOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = BluetoothView()
    }
}

extension BluetoothVC: BluetoothViewOutput {
    func send() {
        presenter?.send()
    }
    
    func search() {
        presenter?.search()
    }
    
    
    
}
