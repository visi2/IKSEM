import UIKit


class StorageVC: UIViewController {
    // MARK: - Visual Components

    private var settingsView: StorageView { return self.view as! StorageView}
    var presenter: StoragePresenter?
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = StorageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    } 
}
