//
//  ProgressBarView.swift
//  CircularProgressBar
//
//  Created by Massimiliano on 12/11/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {

    //MARK: - Properties

    private var bgPath : UIBezierPath!
    private var shapeLayer : CAShapeLayer!
    private var progressLayer : CAShapeLayer!
    
    var progress : Float = 0 {
        willSet(newValue) {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    
    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        bgPath = UIBezierPath()
        self.simpleShape()
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
        bgPath = UIBezierPath()
        self.simpleShape()
    }
    
    //MARK: - Methods

    private func simpleShape() {
        createCirclePath()
        createShapeLayer()
        createProgressLayer()
    }
    
    private func createShapeLayer() {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.darkGray.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
    }

    private func createProgressLayer() {
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.lineWidth = 15
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.strokeEnd = 0.0
        self.layer.addSublayer(progressLayer)
    }

    private func createCirclePath() {
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        bgPath.addArc(withCenter: center, radius: 100, startAngle: 0 - CGFloat.pi / 2, endAngle: (3 * CGFloat.pi) / 2, clockwise: true)
        bgPath.close()
    }
}
