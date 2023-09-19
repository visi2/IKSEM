import UIKit

protocol StorageViewControllerInput {
    func showPoint(point: CGFloat)
}

class StorageVC: UIViewController {
    // MARK: - Visual Components

    private var storageView: StorageView { return self.view as! StorageView}
    var presenter: StoragePresenter?
    var name: String = ""
    var skol: String = ""
    var point: CGFloat = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(controlTextDidChange(_:)),
                                               name: .textFieldNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(control(_:)),
                                               name: .data,
                                               object: nil)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = StorageView()
    }
    
    @objc func controlTextDidChange(_ notification: Notification) {
        if let data = notification.userInfo?["text"] as? String {
            skol = data
            storageView.valueOfSlippageLabel.text = "Значение проскальзывания: \(skol)"
        }
        
        if let data = notification.userInfo?["text2"] as? String {
            name = data
            storageView.nameOfOperatorLabel.text = "Фамилия оператора: \(name)"
        }
    }
    
    @objc func control(_ notification: Notification) {
        if let data = notification.userInfo?["data"] as? CGFloat {
            showPoint(point: data)
            
            print("storage \(data)")
        }
    }
}

extension StorageVC: StorageViewControllerInput {
    func showPoint(point: CGFloat) {
        storageView.showPoint(point: point)
    }
}
