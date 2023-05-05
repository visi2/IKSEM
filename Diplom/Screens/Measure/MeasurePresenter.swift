import UIKit

final class MeasurePresenter {
    // MARK: - Public Properties
    
    weak var viewInput: (UIViewController & MeasureViewControllerInput)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var bluetoothManager = BluetoothManager.shared
    
    // MARK: - Initialization
    
    init(view: UIViewController) {
        self.viewInput = view as? any UIViewController & MeasureViewControllerInput
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(addDataPoint), userInfo: nil, repeats: true)
    }
    
    @objc func addDataPoint() {
        let res = bluetoothManager.fetchFromPeripheral()
        viewInput?.showPoint(point: res)
        
    }
}

extension MeasurePresenter: MeasureViewControllerOutput {
    func start() {
        timer?.invalidate()
        setupTimer()
        bluetoothManager.sendToPeripheral(text: "1")
    }
    
    func stop() {
        timer?.invalidate()
        bluetoothManager.sendToPeripheral(text: "0")
    }
    
    func flash(_ sender: UISwitch) {
        let isOn = sender.isOn
        let sendText = isOn ? "2" : "3"
        bluetoothManager.sendToPeripheral(text: sendText)
        print(sendText)
    }
    
}

