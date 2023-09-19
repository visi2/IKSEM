import UIKit


class CalibrationVC: UIViewController {
    // MARK: - Visual Components

    private var calibrationView: CalibrationView { return self.view as! CalibrationView}
    var presenter: CalibrationPresenter?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = CalibrationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
