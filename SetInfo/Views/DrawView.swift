//
//  DrawView.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var lastPoint: CGPoint!
    var newPoint: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let lastpoint = touches.first?.location(in: self) else { return  }
      self.lastPoint = lastpoint
        let dotPath = UIBezierPath(ovalIn: CGRect(x: self.lastPoint.x, y: self.lastPoint.y, width: 4, height: 4))
        
        let layer = CAShapeLayer()
        layer.path = dotPath.cgPath
        layer.strokeColor = UIColor.red.cgColor
        self.layer.addSublayer(layer)
        //re-draw
        self.setNeedsDisplay()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let newPoint = touches.first?.location(in: self) else { return  }
        self.newPoint = newPoint
        
        //re-draw
        self.setNeedsDisplay()
        self.lastPoint = newPoint
    }
    
    override func draw(_ rect: CGRect) {
        guard self.newPoint != nil else {
            return
        }
        let layer = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: self.newPoint!.x, y: self.newPoint!.y))
        linePath.addLine(to: CGPoint(x: self.lastPoint.x, y: self.lastPoint.y))
        layer.path = linePath.cgPath
        layer.strokeColor = UIColor.orange.cgColor
        layer.lineWidth = 2
        layer.lineJoin = CAShapeLayerLineJoin.round
        self.layer.addSublayer(layer)
        
    }
    
}
