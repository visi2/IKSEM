import UIKit


class DetailBluetoothView: UIView {

    private lazy var table: BluetoothTableView = {
        let table = BluetoothTableView()
        table.translatesAutoresizingMaskIntoConstraints = false

        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting UI Methods
    
     func setupUI() {
        
        self.addSubview(table)
        
        self.backgroundColor = Resources.Colors.bluetoothtableViewBackgroundColor
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        table.setup()
    }
        
}
