import UIKit


final class DataView: UIView {
    private struct Constants {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 15
        static let shadowRadius: CGFloat = 6
        static let shadowOpacity: Float = 1
    }
    
    //MARK: - Visual Components
    
    private lazy var namelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "ИКСЭМ №: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var datelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "Дата: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "Время: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var operatorlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "Оператор: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var templabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "Tемпература: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mileagelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .right
        label.text = "Пробег: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5.0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    private lazy var dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2.0
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
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
        
        self.backgroundColor = Resources.Colors.dataBackgroundColor
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = UIColor(hexString: "#B1B9FF").cgColor
        self.layer.shadowColor = UIColor(hexString: "#B1B9FF").cgColor
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowOffset = .zero
        
        [namelabel, datelabel, timelabel].forEach({
            firstLineStackView.addArrangedSubview($0)
        })
        
        [templabel, templabel].forEach({
            stackView2.addArrangedSubview($0)
        })
        
        [firstLineStackView, operatorlabel, stackView2].forEach({
            dataStackView.addArrangedSubview($0)
        })
        
        self.addSubview(dataStackView)
        
        NSLayoutConstraint.activate([
            dataStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            dataStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            dataStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            dataStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
