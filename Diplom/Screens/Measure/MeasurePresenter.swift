import UIKit

final class MeasurePresenter {
    // MARK: - Public Properties
    
    weak var viewInput: (UIViewController & MeasureViewControllerInput)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    
    // MARK: - Initialization
    
    init(view: UIViewController) {
        self.viewInput = view as? any UIViewController & MeasureViewControllerInput
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addDataPoint), userInfo: nil, repeats: true)
    }
    
    @objc func addDataPoint() {
        let dataPoint = CGFloat(arc4random_uniform(UInt32(200 - 20)))
        viewInput?.showPoint(point: dataPoint)
        
    }
}

extension MeasurePresenter: MeasureViewControllerOutput {
    
    func start() {
        timer?.invalidate()
        setupTimer()
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    
}

