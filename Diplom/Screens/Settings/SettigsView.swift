import UIKit

final class SettingsView: UIView {
    //MARK: - Visual Components
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delaysContentTouches = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var namelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Имя:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.backgroundColor = Resources.Colors.backgroundText
        textField.textColor = UIColor(hexString: "#FFFFFF")
        textField.layer.cornerRadius = 10
        textField.setPadding(left: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var radiusMeasurelabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Радиус измерительного колеса, мм:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var radiusTextField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите радис в мм"
        textField.backgroundColor = Resources.Colors.backgroundText
        textField.textColor = UIColor(hexString: "#FFFFFF")
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.setPadding(left: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var radiusForwardlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Радиус ведущего колеса, мм:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var radiusTextField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите радис в мм"
        textField.backgroundColor = Resources.Colors.backgroundText
        textField.textColor = UIColor(hexString: "#FFFFFF")
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.setPadding(left: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var skollabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Значение проскальзывания, %:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skolTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите значение в %"
        textField.backgroundColor = Resources.Colors.backgroundText
        textField.textColor = UIColor(hexString: "#FFFFFF")
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.setPadding(left: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: AppButton = {
        let button = AppButton(text: "Save changes", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var downloadSettingsButton: AppButton = {
        let button = AppButton(text: "Download settings", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var passwordlabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.textColorUIlabel
        label.textAlignment = .center
        label.text = "Пароль:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.backgroundColor = Resources.Colors.backgroundText
        textField.textColor = UIColor(hexString: "#FFFFFF")
        textField.layer.cornerRadius = 10
        textField.setPadding(left: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordButton: AppButton = {
        let button = AppButton(text: "Ввести", radius: 10, type: 3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackViewPassword: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Private Properties
    
    private weak var controller: SettingsVC?
    var activeFieldFrame: CGRect?
    
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
        
        self.addSubview(scrollView)
        
        [passwordTextField, passwordButton].forEach({
            stackViewPassword.addArrangedSubview($0)
        })
        
        [namelabel, nameTextField, radiusMeasurelabel, radiusTextField1, radiusForwardlabel, radiusTextField2,
         skollabel, skolTextField, saveButton, downloadSettingsButton, passwordlabel, stackViewPassword].forEach({
            stackViewAll.addArrangedSubview($0)
        })
        
        
        scrollView.addSubview(stackViewAll)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackViewAll.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackViewAll.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackViewAll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackViewAll.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        scrollView.contentSize = stackViewAll.frame.size
        scrollView.gestureRecognizers?.forEach {
            $0.delaysTouchesBegan = false
            $0.cancelsTouchesInView = false
        }
        
        
        addDoneButtonOnKeyboard()
    }
    
    private func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        nameTextField.inputAccessoryView = doneToolbar
        radiusTextField1.inputAccessoryView = doneToolbar
        radiusTextField2.inputAccessoryView = doneToolbar
        skolTextField.inputAccessoryView = doneToolbar
        passwordTextField.inputAccessoryView = doneToolbar
        
    }
    
    @objc private func doneButtonAction(){
        nameTextField.resignFirstResponder()
        radiusTextField1.resignFirstResponder()
        radiusTextField2.resignFirstResponder()
        skolTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - Public Methods
    
    func setSize(contentInsets: UIEdgeInsets) {
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        if contentInsets == .zero {
            return
        }
    }
    
    func scrollToActiveFrame() {
        if let viewFrame = activeFieldFrame {
            scrollView.scrollRectToVisible(viewFrame, animated: true)
        } else if let viewFrame = stackViewAll.arrangedSubviews.last?.frame  {
            scrollView.scrollRectToVisible(viewFrame, animated: true)
        }
    }
}
