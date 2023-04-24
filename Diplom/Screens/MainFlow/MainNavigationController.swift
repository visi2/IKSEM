import UIKit
import CoreBluetooth

enum Tabs: Int {
    case measure = 1
    case bluetooth = 2
    case calibration = 3
    case storage = 4
    case settings = 5
}

final class MainNavigationController: UITabBarController {
    //MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewControllers
    
    private func configure() {
        tabBar.backgroundColor = .black
        tabBar.tintColor = Resources.Colors.activeTabBar
        tabBar.barTintColor = Resources.Colors.activeTabBar
        
        tabBar.layer.masksToBounds = true
        
        let measureVC = AppModuleBuilder.measureBuild()
        let bluetoothVC = AppModuleBuilder.bluetoothBuild()
        let calibrationVC = CalibrationVC()
        let storageVC = StorageVC()
        let settingsVC = SettingsVC()
        
        
        measureVC.tabBarItem = UITabBarItem(title: Resources.Strings.measure,
                                            image: Resources.Images.measure,
                                            tag: 1)
        
        bluetoothVC.tabBarItem = UITabBarItem(title: Resources.Strings.bluetooth,
                                              image: Resources.Images.bluetooth,
                                              tag: 1)
        
        calibrationVC.tabBarItem = UITabBarItem(title: Resources.Strings.calibration,
                                                image: Resources.Images.calibration,
                                                tag: 1)
        
        storageVC.tabBarItem = UITabBarItem(title: Resources.Strings.storage,
                                            image: Resources.Images.storage,
                                            tag: 1)
        
        settingsVC.tabBarItem = UITabBarItem(title: Resources.Strings.settings,
                                            image: Resources.Images.settings,
                                            tag: 1)
        
        
        setViewControllers([measureVC,
                            bluetoothVC,
                            calibrationVC,
                            storageVC,
                            settingsVC
                           ],
                           animated: true)
    }
    

}

