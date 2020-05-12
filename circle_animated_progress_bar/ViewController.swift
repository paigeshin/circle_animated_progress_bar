//
//  ViewController.swift
//  circle_animated_progress_bar
//
//  Created by shin seunghyun on 2020/05/06.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let's start by drawing a circle somehow
        
        /** 원 그리기 **/
        
        
        let trackLayer: CAShapeLayer = CAShapeLayer()
        
        let center: CGPoint = view.center
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: 100,
            startAngle: -CGFloat.pi / 2,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        )
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round //모서리 부분을 둥글게 만든다.
        shapeLayer.strokeEnd = 0
        
        /** 실제로 보여줌 **/
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    /** animation **/
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        let basicAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.01
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basic")
    }


}

