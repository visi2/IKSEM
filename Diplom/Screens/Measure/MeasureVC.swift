import UIKit


final class MeasureVC: UIViewController {
    // MARK: - Visual Components
    
    private var measureView: MeasureView { return self.view as! MeasureView}
    
    // MARK: - Public Properties

    weak var presenter: (AnyObject)?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = MeasureView()
    }
}
