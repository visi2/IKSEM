import UIKit

enum AppModuleBuilder {
    
    static func measureBuild() -> UIViewController {
        let view = MeasureVC()
        let presenter = MeasurePresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func bluetoothBuild() -> UIViewController {
        let view = BluetoothVC()
        let presenter = BluetoothPresenter(view: view)
        view.presenter = presenter
        return view
    }
}

