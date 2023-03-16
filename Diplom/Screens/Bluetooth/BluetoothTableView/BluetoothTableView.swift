import UIKit

class BluetoothTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    let dataArray = ["Item 1", "Item 2", "Item 3"]
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a table view programatically
        tableView = UITableView(frame: view.bounds, style: .plain)

        // Set the delegate and data source
        tableView.delegate = self
        tableView.dataSource = self

        // Register the table view cell class and its reuse identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        // Set the table view's row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        // Add the table view to the view controller's view hierarchy
        view.addSubview(tableView)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        // Configure the cell
        cell.textLabel?.text = dataArray[indexPath.row]

        return cell
    }

    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
