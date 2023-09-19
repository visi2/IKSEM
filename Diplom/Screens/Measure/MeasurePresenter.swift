import UIKit

final class MeasurePresenter {
    // MARK: - Public Properties
    
    weak var viewInput: (UIViewController & MeasureViewControllerInput)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var flag: Bool = false
    private var bluetoothManager = BluetoothManager.shared
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Initialization
    
    init(view: UIViewController) {
        self.viewInput = view as? any UIViewController & MeasureViewControllerInput
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(controlDataDidChange(_:)),
                                               name: .data,
                                               object: nil)
    }
    
    @objc func controlDataDidChange(_ notification: Notification) {
        if let data = notification.userInfo?["data"] as? CGFloat {
            
            if flag {
                viewInput?.showPoint(point: data)
            }
            
        }
    }
}

extension MeasurePresenter: MeasureViewControllerOutput {
    func start() {
        bluetoothManager.sendToPeripheral(text: "1")
        flag = true
    }
    
    func stop() {
        bluetoothManager.sendToPeripheral(text: "0")
    }
    
    func flash(_ sender: UISwitch) {
        let isOn = sender.isOn
        let sendText = isOn ? "2" : "3"
        bluetoothManager.sendToPeripheral(text: sendText)
        print(sendText)
    }
    
}

