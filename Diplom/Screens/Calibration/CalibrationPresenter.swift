import UIKit


final class CalibrationPresenter {
    
    // MARK: - Public Properties
    weak var viewInput: UIViewController?

    init(view: UIViewController) {
        self.viewInput = view
    }
}

