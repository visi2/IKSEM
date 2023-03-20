import UIKit


class ViewController: UIViewController {
    private var bluetoothView: DetailBluetoothView { return self.view as! DetailBluetoothView}
    
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = DetailBluetoothView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bluetoothView.setupUI()
    }
}
