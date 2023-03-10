import UIKit

final class MeasureVC: UIViewController {
    // MARK: - Visual Components
    
    private var measureView: MeasureView { return self.view as! MeasureView}
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = MeasureView()
    }
}
