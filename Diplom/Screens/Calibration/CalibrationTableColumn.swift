import UIKit

final class CalibrationTableColumn: UIView {
    private struct Constants {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 15
        static let shadowRadius: CGFloat = 6
        static let shadowOpacity: Float = 1
    }
    //MARK: - Visual Components
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Private Properties
    
    private let textElements: Array<String?>

    //MARK: - Init
    
    required init(textElements: Array<String?>) {
        self.textElements = textElements
        
        super.init(frame: .zero)
        
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
    private func setupUI() {
        
        self.backgroundColor = Resources.Colors.backgroundColor
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = UIColor(hexString: "#B1B9FF").cgColor
        self.layer.shadowColor = UIColor(hexString: "#B1B9FF").cgColor
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowOffset = .zero
        
        textElements.indices.forEach { index in
            let textInRowLabel = UILabel()
            textInRowLabel.textColor = .white
            textInRowLabel.text = textElements[index] ?? "---"
            print(textElements[index])
            
            stackView.addArrangedSubview(textInRowLabel)
        }
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])

    }
    
    //MARK: - Private Methods
    
}
