import UIKit

final class StorageView: UIView {
    //MARK: - Visual Components
    
    private lazy var chartView: UIImageView = {
        let chartview = UIImageView()
        chartview.image = UIImage(named: "fake.png")
        chartview.translatesAutoresizingMaskIntoConstraints = false
        return chartview
    }()
    
    private lazy var datelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Дата записи протокола: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var serialNumberlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Серийный номер ИКСЭМ:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateStartStopMeasurelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Дата начала и окончания записи:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var averageKCLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Среднее значение КС:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var averageSpeedLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Средняя скорость:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueOfSlippageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Значение проскальзывания:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueOfDistanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Пройденное расстояние:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameOfOperatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Фамилия оператора:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Температура:"
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
    
    private lazy var showMapButton: AppButton = {
        let button = AppButton(text: "Показать на карте", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var halfSwitch: UISwitch = {
        let halfSwitch = UISwitch()
        halfSwitch.translatesAutoresizingMaskIntoConstraints = false
        return halfSwitch
    }()
    
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
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.axis = .vertical
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
        
        [showMapButton, halfSwitch].forEach({
            stackView.addArrangedSubview($0)
        })
        
        [datelabel, serialNumberlabel, dateStartStopMeasurelabel, averageKCLabel,
         averageSpeedLabel, valueOfSlippageLabel, valueOfDistanceLabel,
         nameOfOperatorLabel, tempLabel, stackView].forEach({
            allStackView.addArrangedSubview($0)
        })
        
        [chartView, allStackView].forEach({
            self.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            chartView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            allStackView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            allStackView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            allStackView.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            allStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

