import UIKit

protocol BluetoothViewOutput {
    func searchPeripheral()
    func disconnectPeripheral()
    func clearListOfPeripherals()
}

final class BluetoothView: UIView {
    //MARK: - Visual Components
    private lazy var table: BluetoothTableView = {
        let table = BluetoothTableView()
        table.view.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var searchButton: AppButton = {
        let button = AppButton(text: "Device search", radius: 15, type: 3)
        button.addTarget(nil, action: #selector(BluetoothVC.searchPeripheral), for: .touchUpInside)
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
    
    private lazy var clearButton: AppButton = {
        let button = AppButton(text: "Clear list", radius: 15, type: 3)
        button.addTarget(nil, action: #selector(BluetoothVC.clearListOfPeripheral), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var previouslyLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Previously connected devices"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        [stackView, table.view, previouslyLabel, clearButton ].forEach({
            self.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/10)
        ])
        
        NSLayoutConstraint.activate([
            previouslyLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            previouslyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            previouslyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            table.view.topAnchor.constraint(equalTo: previouslyLabel.bottomAnchor, constant: 50),
            table.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            table.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            clearButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            clearButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            clearButton.heightAnchor.constraint(equalTo: searchButton.heightAnchor),
            clearButton.widthAnchor.constraint(equalTo: searchButton.widthAnchor),
        ])
    }
    
    
    // MARK: - Actions
    
}



