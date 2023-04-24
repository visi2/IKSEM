import UIKit

protocol BluetoothViewOutput: AnyObject {
    func connectPeripheral()
    func disconnectPeripheral()
}

final class BluetoothView: UIView {
    //MARK: - Visual Components
    
    private lazy var searchButton: AppButton = {
        let button = AppButton(text: "Device connect", radius: 15, type: 3)
        button.addTarget(nil, action: #selector(BluetoothVC.connectPeripheral), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var disconectButton: AppButton = {
        let button = AppButton(text: "Disconnect", radius: 15, type: 3)
        button.addTarget(nil, action: #selector(BluetoothVC.disconnectPeripheral), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Private Properties
    
    private var controller: BluetoothVC?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        controller = BluetoothVC()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
    private func setupUI() {
        
        self.backgroundColor = Resources.Colors.backgroundColor
        
        [searchButton, disconectButton].forEach({
            stackView.addArrangedSubview($0)
        })
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10)
        ])
    }
}




