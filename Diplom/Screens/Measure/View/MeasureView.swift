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
    
    private lazy var firstBarView: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var secondBarView: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var thirdBarView: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var fourthBarView: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var barViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var scale: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 1.0
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        var currentNum = 0
        for _ in 0...10 {
            let label = UILabel()
            label.text = "\(currentNum)"
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .white
            currentNum += 10
            stackView.addArrangedSubview(label)
        }
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
        label.text = "ИКСЭМ"
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
        stackView.spacing = 2.0
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
        
        [chartView, barViewsStackView, scale, dataView, dataStackView, buttonStackView].forEach({
            self.addSubview($0)
        })
        
        [firstBarView, secondBarView, thirdBarView, fourthBarView].forEach({
            barViewsStackView.addArrangedSubview($0)
        })
        
        [namelabel, batteryView, statusLabel].forEach({
            dataStackView.addArrangedSubview($0)
        })
        
        [startButton, lightSwitch, stopButton].forEach({
            buttonStackView.addArrangedSubview($0)
        })
        // self.stackView4.addArrangedSubview(offlabel)
        // self.stackView4.addArrangedSubview(onlabel)
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            chartView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            barViewsStackView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10),
            barViewsStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 10),
            barViewsStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -10),
            barViewsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            scale.topAnchor.constraint(equalTo: barViewsStackView.bottomAnchor, constant: 5),
            scale.leadingAnchor.constraint(equalTo: barViewsStackView.leadingAnchor, constant: -5),
            scale.trailingAnchor.constraint(equalTo: barViewsStackView.trailingAnchor, constant: 10),
            scale.heightAnchor.constraint(equalTo: firstBarView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: scale.bottomAnchor, constant: 20),
            dataView.leadingAnchor.constraint(equalTo: barViewsStackView.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: barViewsStackView.trailingAnchor),
            dataView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])
        
        NSLayoutConstraint.activate([
            dataStackView.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 10),
            dataStackView.widthAnchor.constraint(equalTo: dataView.widthAnchor, multiplier: 0.7),
            dataStackView.heightAnchor.constraint(equalTo: dataStackView.widthAnchor, multiplier: 0.2),
            dataStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: dataStackView.bottomAnchor, constant: 50),
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

