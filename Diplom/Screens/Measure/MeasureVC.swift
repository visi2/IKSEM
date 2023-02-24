import UIKit

final class MeasureVC: UIViewController {
    
    weak var measureView: MeasureView?
    
    override func loadView() {
        super.loadView()
        view = MeasureView()
    }
}
