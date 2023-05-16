import UIKit

protocol MeasureViewOutput: AnyObject {
    func start()
    func stop()
}

protocol MeasureViewInput: AnyObject {
    func showPoint(point: CGFloat)
}

final class MeasureView: UIView {
    //MARK: - Visual Components
    
   private lazy var chartView: RealTimeGraphView = {
        let chartview = RealTimeGraphView()
        chartview.translatesAutoresizingMaskIntoConstraints = false
        return chartview
    }()
    
    private lazy var scale: UILabel = {
        let label = UILabel()
        label.text = "0.2"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scale1: UILabel = {
        let label = UILabel()
        label.text = "0.4"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scale2: UILabel = {
        let label = UILabel()
        label.text = "0.6"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scale3: UILabel = {
        let label = UILabel()
        label.text = "0.8"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scale4: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scale5: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scaleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = Resources.Colors.dataBackgroundColor
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor(hexString: "#B1B9FF").cgColor
        stackView.layer.shadowColor = UIColor(hexString: "#B1B9FF").cgColor
        stackView.layer.shadowOffset = .zero
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dataView: DataView = {
        let dataView = DataView()
        dataView.translatesAutoresizingMaskIntoConstraints = false
        return dataView
    }()
    
    private lazy var namelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "ИК"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var batteryView: UIImageView = {
        let batteryView = UIImageView()
        batteryView.image = Resources.Images.battery
        batteryView.tintColor = .green
        batteryView.translatesAutoresizingMaskIntoConstraints = false
        return batteryView
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.text = "100%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var startButton: AppButton = {
        let button = AppButton(text: "Start", radius: 20, type: 1)
        button.addTarget(nil, action: #selector(MeasureVC.startVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stopButton: AppButton = {
        let button = AppButton(text: "Stop", radius: 20, type: 2)
        button.addTarget(nil, action: #selector(MeasureVC.stopVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var lightSwitch: UISwitch = {
        let lightSwitch = UISwitch()
        lightSwitch.addTarget(nil, action: #selector(MeasureVC.flash(_:)), for: .valueChanged)
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        return lightSwitch
    }()
    
    private lazy var onlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.text = "On"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var offlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.text = "Off"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 100.0
        stackView.alignment = .center
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
    private func setupUI() {
        
        self.backgroundColor = Resources.Colors.backgroundColor
        
        [chartView, dataView, dataStackView, buttonStackView, lightSwitch, scaleStackView, chartView].forEach({
            self.addSubview($0)
        })
        
        [namelabel, batteryView, statusLabel].forEach({
            dataStackView.addArrangedSubview($0)
        })
        
        [scale4, scale3, scale2, scale1, scale, scale5].forEach({
            scaleStackView.addArrangedSubview($0)
        })
        
        [startButton, stopButton].forEach({
            buttonStackView.addArrangedSubview($0)
        })
        // self.stackView4.addArrangedSubview(offlabel)
        // self.stackView4.addArrangedSubview(onlabel)
        
        NSLayoutConstraint.activate([
            scaleStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            scaleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            scaleStackView.heightAnchor.constraint(equalToConstant: 263),
            scaleStackView.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: scaleStackView.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: scaleStackView.trailingAnchor),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            chartView.heightAnchor.constraint(equalTo: scaleStackView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 50),
            dataView.leadingAnchor.constraint(equalTo: scaleStackView.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            dataView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])
        
        NSLayoutConstraint.activate([
            dataStackView.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 10),
            dataStackView.widthAnchor.constraint(equalTo: dataView.widthAnchor, multiplier: 0.7),
            dataStackView.heightAnchor.constraint(equalTo: dataStackView.widthAnchor, multiplier: 0.2),
            dataStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lightSwitch.topAnchor.constraint(equalTo: dataStackView.bottomAnchor, constant: 20),
            lightSwitch.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: lightSwitch.bottomAnchor, constant: 30),
            buttonStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}

extension MeasureView: MeasureViewInput {
    func showPoint(point: CGFloat) {
        chartView.addDataPoint(point)
    }
}

