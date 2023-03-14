import UIKit
import CoreBluetooth


class BluetoothManager: NSObject, CBCentralManagerDelegate {
    //MARK: - Private Properties
     static let sharedInstance = BluetoothManager()
    var peripheal: CBPeripheral?
    var myCharacteristic: CBCharacteristic?
    var manager: CBCentralManager?
    let dict = [CBCentralManagerOptionShowPowerAlertKey: 1]

    let serviceUUID = CBUUID(string: "0xFFE0")
    let periphealUUID = CBUUID(string: "b06e20c8-82d0-9378-7b6c-ccb088a69669")

    //MARK: - Init
    
    override init() {
        super.init()
        self.manager = CBCentralManager(delegate: self, queue: nil, options: dict)
 
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func send(text: String) {
        if (peripheal != nil && myCharacteristic != nil) {
            let data = text.data(using: .unicode)
            peripheal!.writeValue(data!,  for: myCharacteristic!, type: CBCharacteristicWriteType.withoutResponse)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        if peripheral.identifier.uuidString == periphealUUID.uuidString {
            peripheal = peripheral
            peripheal?.delegate = self
            manager?.connect(peripheal!, options: nil)
            manager?.stopScan()
            print(peripheral)
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("Bluetooth is switched off")
        case .poweredOn:
            print("Bluetooth is switched on")
        case .unsupported:
            print("Bluetooth is not supported")
        default:
            print("Unknown state")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices([serviceUUID])
        print("Connected to " +  peripheral.name!)  
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from " +  peripheral.name!)
        
        peripheal = nil
        myCharacteristic = nil
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error!)
    }
}

extension BluetoothManager: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        myCharacteristic = characteristics[0]
    }
}
