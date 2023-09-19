import UIKit


protocol StorageViewInput: AnyObject {
    func showPoint(point: CGFloat)
}

final class StorageView: UIView {
    //MARK: - Visual Components
    
    private lazy var chartView: RealTimeGraphView = {
         let chartview = RealTimeGraphView()
         chartview.translatesAutoresizingMaskIntoConstraints = false
         return chartview
     }()
    
    private lazy var datelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 15)
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: today)
        label.text = "Дата записи протокола: \(dateString)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var serialNumberlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Серийный номер ИКС: 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var dateStartStopMeasurelabel: UILabel = {
//        let label = UILabel()
//        label.textColor = Resources.Colors.textColorUIlabel
//        label.textAlignment = .center
//        label.text = "Дата начала записи:"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
//    private lazy var averageKCLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = Resources.Colors.textColorUIlabel
//        label.textAlignment = .center
//        label.text = "Среднее значение КС: N/A"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private lazy var averageSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Средняя скорость: N/A"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var valueOfSlippageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text =  "Значение проскальзывания: N/A"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueOfDistanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Пройденное расстояние: N/A"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var nameOfOperatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.text = "Фамилия оператора: N/A"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var listOfProtocolsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Список протоколов:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var showMapButton: AppButton = {
//        let button = AppButton(text: "Показать на карте", radius: 10, type: 3)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    private lazy var halfSwitch: UISwitch = {
//        let halfSwitch = UISwitch()
//        halfSwitch.translatesAutoresizingMaskIntoConstraints = false
//        return halfSwitch
//    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.spacing = 50
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var allStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    // MARK: - Private Properties
    
    private weak var controller: StorageVC?
    
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
        
//        [showMapButton, halfSwitch].forEach({
//            stackView.addArrangedSubview($0)
//        })
        
        [scale4, scale3, scale2, scale1, scale, scale5].forEach({
            scaleStackView.addArrangedSubview($0)
        })
        
        [datelabel, serialNumberlabel,
         averageSpeedLabel, valueOfDistanceLabel,
         nameOfOperatorLabel, tempLabel].forEach({
            allStackView.addArrangedSubview($0)
        })
        
        [chartView, allStackView, scaleStackView].forEach({
            self.addSubview($0)
        })
        
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
            allStackView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            allStackView.leadingAnchor.constraint(equalTo: scaleStackView.leadingAnchor),
            allStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            allStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}


extension StorageView: StorageViewInput {
    func showPoint(point: CGFloat) {
        chartView.addDataPoint(point)
    }
}
