//
//  Rainbow.swift
//  Rainbow
//
//  Created by Yans on 16/5/17.
//  Copyright © 2016年 Yans. All rights reserved.
//

import UIKit

@IBDesignable
class Rainbow: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBInspectable var firstColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0)
    @IBInspectable var secondColor: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0)
    @IBInspectable var innerRadius: CGFloat = 80.0
    @IBInspectable var middleRadius: CGFloat = 150.0
    @IBInspectable var outterRadius: CGFloat = 218.0
    @IBInspectable var BottomOvalLineWidth: CGFloat = 1.0
    @IBInspectable var MiddleCapLineWidth: CGFloat = 1.0
    @IBInspectable var TopOvalLineWidth: CGFloat = 1.0
    @IBInspectable var firstCapRadius: CGFloat = 20.0
    @IBInspectable var secondCapRadius: CGFloat = 20.0
    @IBInspectable var thirdCapRadius: CGFloat = 20.0
    
    func addOval(lineWidth: CGFloat, path: CGPathRef, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        layer.addSublayer(arc)
    }
    
    func addCirle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
        let X = CGRectGetMidX(self.bounds)
        let Y = CGRectGetMidY(self.bounds)
        print(X,Y)
        // Bottom Oval
        let pathBottom = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(BottomOvalLineWidth, path: pathBottom, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
        // Middle Cap
        let pathMiddle = UIBezierPath(ovalInRect: CGRectMake((X - (capRadius/2)) - (arcRadius/2), (Y - (capRadius/2)), capRadius, capRadius)).CGPath
        self.addOval(MiddleCapLineWidth, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: color, shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffsset: CGSizeZero)

        // Top Oval
        let pathTop = UIBezierPath(ovalInRect: CGRectMake((X - (arcRadius/2)), (Y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(TopOvalLineWidth, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
    }
    
    override func drawRect(rect: CGRect) {
        // Add ARCs
        self.addCirle(self.innerRadius, capRadius: self.firstCapRadius, color: self.firstColor)
        self.addCirle(self.middleRadius, capRadius: self.secondCapRadius, color: self.secondColor)
        self.addCirle(self.outterRadius, capRadius: self.thirdCapRadius, color: self.thirdColor)
        
    }
    

}
