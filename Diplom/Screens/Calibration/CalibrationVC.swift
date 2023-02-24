import UIKit

class CalibrationVC: UIViewController {
    // MARK: - Private Properties

    private var calibrationView: CalibrationView { return self.view as! CalibrationView}
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = CalibrationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Setting UI Methods
    
   
}
