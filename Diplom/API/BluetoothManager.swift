import UIKit
import CoreBluetooth


protocol APIBluetoothManager {
    func connectPeripheral()
    func disconnectPeripheral()
    func sendToPeripheral(text: String)
    func fetchFromPeripheral() -> CGFloat
}


final class BluetoothManager: NSObject {
    
    static let shared = BluetoothManager()

    //MARK: - Private Properties
    
    private var peripheal: CBPeripheral?
    private var characteristic: CBCharacteristic?
    private var manager: CBCentralManager?
    private let serviceUUID = CBUUID(string: "0xFFE0")
    private let periphealUUID = CBUUID(string: "b06e20c8-82d0-9378-7b6c-ccb088a69669")
    private var result: CGFloat = 0
    
    //MARK: - Init
    
    override init() {
        super.init()
        self.manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    //MARK: - CBCentralManagerDelegate

extension BluetoothManager: CBCentralManagerDelegate {
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
        if peripheral.identifier.uuidString == periphealUUID.uuidString {
            manager?.stopScan()
            peripheal = peripheral
            peripheal?.delegate = self
            manager?.connect(peripheal!, options: nil)
            
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
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        peripheal = nil
        characteristic = nil
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error!)
    }
}


    //MARK: - CCBPeripheralDelegate

extension BluetoothManager: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        characteristic = characteristics[0]
        for characteristic in characteristics {
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        let value = [UInt8](characteristic.value!)
        let res = CGFloat(value[0])
        self.result = res
        
        let userInfo = ["data": res]
        
        NotificationCenter.default.post(name: .data,
                                        object: nil,
                                        userInfo: userInfo)
    }
}


    //MARK: - Actions

extension BluetoothManager: APIBluetoothManager {
    func connectPeripheral() {
        manager?.scanForPeripherals(withServices: nil)
    }
    
    func disconnectPeripheral() {
        guard let peripheal = peripheal else {return}
        manager?.cancelPeripheralConnection(peripheal)
    }
    
    func sendToPeripheral(text: String) {
        if (peripheal != nil && characteristic != nil) {
            let data = text.data(using: .ascii)
            peripheal!.writeValue(data!,  for: characteristic!, type: CBCharacteristicWriteType.withoutResponse)
            print(data!)
        }
    }
    
    func fetchFromPeripheral() -> CGFloat {
        return result
    }
}
