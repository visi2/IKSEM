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
    
    static func calibrationBuild() -> UIViewController {
        let view = CalibrationVC()
        let presenter = CalibrationPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func storageBuild() -> UIViewController {
        let view = StorageVC()
        let presenter = StoragePresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func settingsBuild() -> UIViewController {
        let view = SettingsVC()
        let presenter = SettingsPresenter(view: view)
        view.presenter = presenter
        return view
    }
}

