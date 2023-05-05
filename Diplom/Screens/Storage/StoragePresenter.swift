import UIKit


final class StoragePresenter {
    
    // MARK: - Public Properties
    weak var viewInput: UIViewController?

    init(view: UIViewController) {
        self.viewInput = view
    }
}


