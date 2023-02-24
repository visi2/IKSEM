import UIKit
import AVFoundation


final class MeasureView: UIView {
    //MARK: - Visual Components
    
    private lazy var chartView: UIImageView = {
        let chartview = UIImageView()
        chartview.image = UIImage(named: "fake.png")
        chartview.translatesAutoresizingMaskIntoConstraints = false
        return chartview
    }()
    
    private lazy var barView1: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var barView2: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var barView3: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var barView4: UIView = {
        let barView = UIView()
        barView.backgroundColor = .black
        barView.translatesAutoresizingMaskIntoConstraints = false
        return barView
    }()
    
    private lazy var stackView1: UIStackView = {
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
        label.textColor = .white
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
        label.textColor = .white
        label.text = "0%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView2: UIStackView = {
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stopButton: AppButton = {
        let button = AppButton(text: "Stop", radius: 20, type: 2)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var lightSwitch1: UISwitch = {
        let lightSwitch = UISwitch()
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        return lightSwitch
    }()
    
    private lazy var lightSwitch2: UISwitch = {
        let lightSwitch = UISwitch()
        lightSwitch.translatesAutoresizingMaskIntoConstraints = false
        return lightSwitch
    }()
    
    private lazy var onlabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "On"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var offlabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Off"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2.0
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView4: UIStackView = {
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
        
        
        [chartView, stackView1, scale, dataView, stackView2, stackView4].forEach({
            self.addSubview($0)
        })
        
        [barView1, barView2, barView3, barView4].forEach({
            stackView1.addArrangedSubview($0)
        })
        
        [namelabel, batteryView, statusLabel].forEach({
            stackView2.addArrangedSubview($0)
        })
        
        [lightSwitch1, lightSwitch2].forEach({
            stackView3.addArrangedSubview($0)
        })
        
        [startButton, stackView3, stopButton].forEach({
            stackView4.addArrangedSubview($0)
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
            stackView1.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10),
            stackView1.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 10),
            stackView1.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -10),
            stackView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            
        ])
        
        NSLayoutConstraint.activate([
            scale.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 5),
            scale.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor, constant: -5),
            scale.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 10),
            scale.heightAnchor.constraint(equalTo: barView1.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dataView.topAnchor.constraint(equalTo: scale.bottomAnchor, constant: 20),
            dataView.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor),
            dataView.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor),
            dataView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])
        
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 10),
            stackView2.widthAnchor.constraint(equalTo: dataView.widthAnchor, multiplier: 0.7),
            stackView2.heightAnchor.constraint(equalTo: stackView2.widthAnchor, multiplier: 0.2),
            stackView2.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView4.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 50),
            stackView4.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView4.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView4.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
    }
}
