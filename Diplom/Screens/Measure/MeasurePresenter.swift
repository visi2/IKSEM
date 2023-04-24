import UIKit
import WebKit

final class MeasurePresenter {
    // MARK: - Public Properties
    
    weak var viewInput: UIViewController?
    
    // MARK: - Initialization
    
    init(view: UIViewController) {
        self.viewInput = view
    }
}

