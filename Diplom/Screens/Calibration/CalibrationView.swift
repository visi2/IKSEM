import UIKit

final class CalibrationView: UIView {
    //MARK: - Visual Components
    
    private lazy var tableNamelabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#FFFFFF")
        label.textAlignment = .center
        label.text = "Дата записи протокола: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var takeSettingsButton: AppButton = {
        let button = AppButton(text: "Принять", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var downloadCurrentTableButton: AppButton = {
        let button = AppButton(text: "Загрузить текущую таблицу калибровки", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: AppButton = {
        let button = AppButton(text: "Отменить", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private lazy var stackViewAll: UIStackView = {
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
        
      //  setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
  /*  private func setupUI() {
        self.backgroundColor = Resources.Colors.backgroundColor
        
        [showMapButton, halfSwitch].forEach({
            stackView.addArrangedSubview($0)
        })
        
        [datelabel, serialNumberlabel, dateStartStopMeasurelabel, averageKCLabel,
         averageSpeedLabel, valueOfSlippageLabel, valueOfDistanceLabel,
         nameOfOperatorLabel, tempLabel, stackView].forEach({
            stackViewAll.addArrangedSubview($0)
        })
        
        [chartView, stackViewAll].forEach({
            self.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            chartView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            stackViewAll.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            stackViewAll.trailingAnchor.constraint(equalTo: chartView.trailingAnchor),
            stackViewAll.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
    }
    
   */
}


