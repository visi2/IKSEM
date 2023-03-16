import UIKit

protocol TableViewInput {
    func reload()
}

final class BluetoothTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Piblic Properties
    
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
        reload()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        tableView.backgroundColor = Resources.Colors.bluetoothtableViewBackgroundColor
        self.backgroundColor = Resources.Colors.backgroundColor
        self.addSubview(tableView)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BluetoothTableView.bluetoothPeripheralArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = Resources.Colors.bluetoothtableViewBackgroundColor
        
        cell.textLabel?.text = BluetoothTableView.bluetoothPeripheralArray[indexPath.row]
        
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
