import UIKit

final class DataView: UIView {
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
    
    
    private lazy var stackView1: UIStackView = {
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
    
    
    private lazy var stackViewAll: UIStackView = {
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
        
        
        [namelabel, datelabel, timelabel].forEach({
            stackView1.addArrangedSubview($0)
        })
        
        [templabel, templabel].forEach({
            stackView2.addArrangedSubview($0)
        })
        
        [stackView1, operatorlabel, stackView2].forEach({
            stackViewAll.addArrangedSubview($0)
        })
        
        self.addSubview(stackViewAll)
        
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackViewAll.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackViewAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackViewAll.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
