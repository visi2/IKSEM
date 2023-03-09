import UIKit

final class CalibrationView: UIView {
    //MARK: - Visual Components
    
    private lazy var tableNamelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Таблица калибровки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["Cила"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var firstColumnTagsTView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["10т", "20т", "30т"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var firstColumnTagsOView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["30o", "20o", "10o"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var secondColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["Вес"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var secondColumnValueTView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var secondColumnValueOView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var thirdColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["Мом"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var thirdColumnValueTView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var thirdColumnValueOView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var fourthColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [""])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var fourthColumnValueView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["в", "м", "0в", "0m"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var fifthColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["Тек"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var fifthColumnValueView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var sixthColumnHeaderView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: ["Нов"])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var sixthColumnValueView: CalibrationTableColumn = {
        let column = CalibrationTableColumn(textElements: [nil, nil, nil, nil])
        column.translatesAutoresizingMaskIntoConstraints = false
        return column
    }()
    
    private lazy var firstHalfstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondHalfstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var tableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var momentLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Момент: ---"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Вес: ."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var charactericticStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.axis = .horizontal
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
        
        let headersOfTable = createTable(views: [firstColumnHeaderView, secondColumnHeaderView, thirdColumnHeaderView, fourthColumnHeaderView, fifthColumnHeaderView, sixthColumnHeaderView])
        let firstRowOfTable = createTable(views: [firstColumnTagsTView, secondColumnValueTView, thirdColumnValueTView])
        let secondRowOfTable = createTable(views: [firstColumnTagsOView, secondColumnValueOView, thirdColumnValueOView])
        let secondHalfOfTable = createTable(views: [fourthColumnValueView, fifthColumnValueView, sixthColumnValueView])
        
        [momentLabel, weightLabel].forEach({
            charactericticStackView.addArrangedSubview($0)
        })
        
        [firstRowOfTable, secondRowOfTable].forEach({
            firstHalfstackView.addArrangedSubview($0)
        })
        
        [secondHalfOfTable].forEach({
            secondHalfstackView.addArrangedSubview($0)
        })
        
        [firstHalfstackView, secondHalfstackView].forEach({
            tableStackView.addArrangedSubview($0)
        })
        
        [takeSettingsButton, downloadCurrentTableButton, cancelButton].forEach({
            buttonStackView.addArrangedSubview($0)
        })
        
        [tableNamelabel ,headersOfTable, tableStackView, charactericticStackView, buttonStackView].forEach({
            self.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            tableNamelabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableNamelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableNamelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tableNamelabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            headersOfTable.topAnchor.constraint(equalTo: tableNamelabel.bottomAnchor, constant: 20),
            headersOfTable.leadingAnchor.constraint(equalTo: tableNamelabel.leadingAnchor),
            headersOfTable.trailingAnchor.constraint(equalTo: tableNamelabel.trailingAnchor),
            headersOfTable.heightAnchor.constraint(equalTo: tableNamelabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableStackView.topAnchor.constraint(equalTo: headersOfTable.bottomAnchor),
            tableStackView.leadingAnchor.constraint(equalTo: headersOfTable.leadingAnchor),
            tableStackView.trailingAnchor.constraint(equalTo: headersOfTable.trailingAnchor),
            tableStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
        ])
        
        NSLayoutConstraint.activate([
            charactericticStackView.topAnchor.constraint(equalTo: tableStackView.bottomAnchor, constant: 20),
            charactericticStackView.leadingAnchor.constraint(equalTo: tableStackView.leadingAnchor),
            charactericticStackView.trailingAnchor.constraint(equalTo: tableStackView.trailingAnchor),
            charactericticStackView.heightAnchor.constraint(equalTo: tableStackView.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: charactericticStackView.bottomAnchor, constant: 30),
            buttonStackView.leadingAnchor.constraint(equalTo: charactericticStackView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: charactericticStackView.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func createTable(views: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        views.forEach({
            stackView.addArrangedSubview($0)
        })
        
        return stackView
    }
}


