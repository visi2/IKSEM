import UIKit

protocol MeasureViewControllerInput {
    func showPoint(point: CGFloat)
}

protocol MeasureViewControllerOutput: AnyObject {
    func start()
    func stop()
    func flash(_ sender: UISwitch)
}

final class MeasureVC: UIViewController {
    // MARK: - Visual Components
    
    private var measureView: MeasureView { return self.view as! MeasureView}
    private var timer: Timer?
    
    // MARK: - Public Properties

    var presenter: MeasureViewControllerOutput?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = MeasureView()
    }
    
    //MARK: - Actions
    
    @objc  func startVC() {
        presenter?.start()
    }

    @objc  func stopVC() {
        presenter?.stop()
    }
    
    @objc func flash(_ sender: UISwitch) {
        presenter?.flash(sender)
    }
}

extension MeasureVC: MeasureViewControllerInput {
    func showPoint(point: CGFloat) {
        measureView.showPoint(point: point)
    }
}
