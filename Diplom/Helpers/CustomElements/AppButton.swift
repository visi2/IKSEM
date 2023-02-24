import UIKit

final class AppButton: UIButton {
    //MARK: - Private Properties
    
    private let text: String
    private let radius: CGFloat
    private let type: Int

    //MARK: - Init
    
    required init(text: String, radius: CGFloat, type: Int) {
        self.text = text
        self.radius = radius
        self.type = type
        
        super.init(frame: .zero)
        
        self.setupUI()
        self.addTargets()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
    private func setupUI() {

        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        
        self.layer.cornerRadius = radius
        
        switch type {
        case 1:
            self.backgroundColor = Resources.Colors.inActiveStartButton
        case 2:
            self.backgroundColor = Resources.Colors.inActiveStopButton
        case 3:
            self.backgroundColor = Resources.Colors.inActiveButton
        default:
            fatalError()
        }
    }
    
    //MARK: - Private Methods
    
    private func addTargets() {
        self.addTarget(self, action: #selector(unclicked), for: .touchUpInside)
        self.addTarget(self, action: #selector(clicked), for: .touchDown)
        self.addTarget(self, action: #selector(unclicked), for: .touchDragExit)
        self.setTitleColor(.white, for: .highlighted)
    }
    
    @objc private func unclicked() {

        switch type {
        case 1:
            self.backgroundColor = Resources.Colors.inActiveStartButton
        case 2:
            self.backgroundColor = Resources.Colors.inActiveStopButton
        case 3:
            self.backgroundColor = Resources.Colors.inActiveButton
        default:
            fatalError()
        }
    }
    
    @objc private func clicked() {
        switch type {
        case 1:
            self.backgroundColor = Resources.Colors.activeStartButton
        case 2:
            self.backgroundColor = Resources.Colors.activeStopButton
        case 3:
            self.backgroundColor = Resources.Colors.activeButton
        default:
            fatalError()
        }
    }
}



/*
 private func removeAllTargets() {
     self.removeTarget(self, action: #selector(unclicked), for: .touchUpInside)
     self.removeTarget(self, action: #selector(clicked), for: .touchDown)
     self.removeTarget(self, action: #selector(unclicked), for: .touchDragExit)
     self.setTitleColor(.white, for: .highlighted)
 }
 
private func setAlwaysPressed() {
     self.removeTarget(self, action: #selector(unclicked), for: .touchUpInside)
     self.removeTarget(self, action: #selector(clicked), for: .touchDown)
     self.removeTarget(self, action: #selector(unclicked), for: .touchDragExit)
     
     self.setTitleColor(Resources.Colors.activeButtonTextColor, for: .normal)
    switch type {
    case 1:
        self.backgroundColor = Resources.Colors.inactiveButtonColorStart
    case 2:
        self.backgroundColor = Resources.Colors.inactiveButtonColorStop
    case 3:
        self.backgroundColor = Resources.Colors.inactiveButtonColorStop
    default:
        fatalError()
    }
     self.layer.shadowOffset = CGSize(
         width: -Constants.shadowOffsetWidth,
         height: -Constants.shadowOffsetHeight
     )
 }
 */
