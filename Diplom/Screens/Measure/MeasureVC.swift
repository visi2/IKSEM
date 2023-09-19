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
    private var name: String = "N/A"
    
    // MARK: - Public Properties

    var presenter: MeasureViewControllerOutput?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = MeasureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(controlTextDidChange(_:)),
                                               name: .textFieldNotification,
                                               object: nil)
        
    }
    
    @objc func controlTextDidChange(_ notification: Notification) {
        if let data = notification.userInfo?["text2"] as? String {
            name = data
            measureView.dataView.operatorlabel.text = "Оператор: \(name)"
        }
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
        var currentPoint: CGFloat = 0
        if point > 250 {
            currentPoint = 250
        }
        print("point \(point)")
        measureView.showPoint(point: point)
    }
}
