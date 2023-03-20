import UIKit

protocol TableViewInput {
    func reload()
}

final class BluetoothTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Public Properties
    
    public var tableView: UITableView!
    public static var bluetoothPeripheralArray: Array<String> = []
    
    //MARK: - Private Properties
    
    private let cellReuseIdentifier = "cell"
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        tableView.backgroundColor = Resources.Colors.bluetoothtableViewBackgroundColor
        self.backgroundColor = Resources.Colors.backgroundColor
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = Resources.Colors.bluetoothtableViewBackgroundColor
        
        cell.textLabel?.text = "cell"
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}


extension BluetoothTableView: TableViewInput {
    func reload() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.reloadData()
            print("check")
        }
    }
}
