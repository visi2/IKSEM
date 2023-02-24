import UIKit

class SettingsVC: UIViewController {
    // MARK: - Private Properties

    private var settingsView: SettingsView { return self.view as! SettingsView}
    var activeFieldFrame: CGRect?
    
    
    // MARK: - Deinitialization

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotificationObserverKeyboard()
    }
    

    // MARK: - Setting UI Methods
    
    private func addNotificationObserverKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardValue = notification
            .userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }
        
        

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        let contentInsets = UIEdgeInsets(top: 0,
                                         left: 0,
                                         bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom,
                                         right: 0)
        
        settingsView.scrollToActiveFrame()
        settingsView.setSize(contentInsets: contentInsets)
       
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        
        self.settingsView.setSize(contentInsets: contentInsets)
    }
}

