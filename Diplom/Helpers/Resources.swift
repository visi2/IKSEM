import UIKit


enum Resources {
    
    enum Colors {
        static var activeTabBar = UIColor(hexString: "#0000FF")
        static var inActiveStartButton = UIColor(hexString: "#00FF00")
        static var activeStartButton = UIColor(hexString: "#008000")
        static var inActiveStopButton = UIColor(hexString: "#FF0000")
        static var activeStopButton = UIColor(hexString: "#900020")
        static var inActiveButton = UIColor(hexString: "#0000FF")
        static var activeButton = UIColor(hexString: "#000080")
        static var backgroundColor = UIColor(hexString: "#002137")
        static var backgroundText = UIColor(hexString: "#808080")
        static var dataBackgroundColor = UIColor(hexString: "#293133")
        static var textColorUIlabel = UIColor(hexString: "#42AAFF")
    }
    
    enum Images {
        static var measure = UIImage(systemName: "airplane.arrival")
        static var bluetooth = UIImage(systemName: "dot.radiowaves.left.and.right")//Check soon
        static var calibration = UIImage(systemName: "vial.viewfinder")//scope
        static var storage = UIImage(systemName: "folder")
        static var settings = UIImage(systemName: "gearshape")
        static var battery = UIImage(systemName: "battery.0")
    }
    
    enum Strings {
        static var measure = "Measure"
        static var bluetooth = "Bluetooth"
        static var calibration = "Calibration"
        static var storage = "Storage"
        static var settings = "Settings"
    }
}
