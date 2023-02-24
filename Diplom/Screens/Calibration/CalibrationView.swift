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
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondHalfstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
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
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
    private func createStack() {
        
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func setupUI() {
        self.backgroundColor = Resources.Colors.backgroundColor
        
       // self.addSubview(firstColumnHeader)
        
        
//        [firstColumn].forEach({
//            self.addSubview($0)
//        })
        
       
        
    }
}


