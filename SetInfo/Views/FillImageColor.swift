//
//  FillImageColor.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 23/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit


class FillImageColor: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var paintColor: UIColor?
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "Clown"))
//        layer.contents = UIImage(named: "Clown")?.cgImage
//        layer.contentsGravity = CALayerContentsGravity.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastpoint = touches.first?.location(in: self) else { return  }
        self.lastPoint = lastpoint
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let newPoint = touches.first?.location(in: self) else { return  }
         self.lines.append(Line(_start: lastPoint, _end: newPoint))
        self.lastPoint = newPoint
        self.setNeedsDisplay()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.lines.removeAll()
    }
    
     override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        for line in self.lines {
            path.move(to: CGPoint(x: line.start.x, y: line.start.y))
            path.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
        }
        let first = self.lines.first
        path.addLine(to: CGPoint(x: first?.start.x ?? 0, y: first?.end.y ?? 0))
        path.close()
        shapeLayer.path = path.cgPath
        shapeLayer.backgroundColor = UIColor.clear.cgColor
        if let color = self.paintColor {
         shapeLayer.fillColor = color.cgColor
        } else {
        shapeLayer.fillColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
        self.layer.addSublayer(shapeLayer)
        
    }
}
