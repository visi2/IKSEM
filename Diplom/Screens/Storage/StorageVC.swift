import UIKit

class StorageVC: UIViewController {
    
    // MARK: - Private Properties

    private var settingsView: StorageView { return self.view as! StorageView}
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = StorageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Setting UI Methods
    
   
}
