import UIKit

final class RealTimeGraphView: UIView {
    
    let maxDataPoints = 20
    var dataPoints: [CGFloat] = [0]
    let mmSize: CGFloat = 3.1 // размер в миллиметрах
    let gridSize: CGFloat = 16.8// размер сетки в пикселях

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupGrid()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGrid() {
        let size = CGSize(width: mmSize * gridSize, height: mmSize * gridSize)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()!

        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(0.5)

        for i in 0...Int(size.width) {
            if i % Int(mmSize * gridSize) == 0 {
                context.move(to: CGPoint(x: i, y: 0))
                context.addLine(to: CGPoint(x: i, y: Int(size.height)))
            }
        }

        for i in 0...Int(size.height) {
            if i % Int(mmSize * gridSize) == 0 {
                context.move(to: CGPoint(x: 0, y: i))
                context.addLine(to: CGPoint(x: Int(size.width), y: i))
            }
        }

        context.strokePath()

        let image = UIGraphicsGetImageFromCurrentImageContext()

        self.backgroundColor = UIColor(patternImage: image!)

        UIGraphicsEndImageContext()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let graphRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        context.setStrokeColor(UIColor(hexString: "#B1B9FF").cgColor)
        context.stroke(graphRect, width: 2.0)
        
        let interval = graphRect.width / CGFloat(maxDataPoints)
        var x: CGFloat = graphRect.origin.x
        var y: CGFloat = graphRect.origin.y + (graphRect.height - dataPoints[0])
        context.move(to: CGPoint(x: x, y: y))
        for i in 1..<dataPoints.count {
            x += interval
            y = graphRect.origin.y + (graphRect.height - dataPoints[i])
            context.addLine(to: CGPoint(x: x, y: y))
        }
        context.setStrokeColor(UIColor.red.cgColor)
        context.strokePath()
    }
    
    func addDataPoint(_ dataPoint: CGFloat) {
        self.dataPoints.append(dataPoint)
        if dataPoints.count > maxDataPoints {
            dataPoints.removeFirst()
        }
        setNeedsDisplay()
    }
}
