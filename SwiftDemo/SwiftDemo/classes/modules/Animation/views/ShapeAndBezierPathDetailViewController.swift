//
//  ShapeAndBezierPathDetailViewController.swift
//  swift-demo
//
//  Created by rayootech on 16/4/14.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit
enum LayerType{
  case LayerType_Shapelayer_Rect
  case LayerType_Shapelayer_Circle
  case LayerType_BezierPath_Rect
  case LayerType_BezierPath_Circle
  case LayerType_CirRound
  case LayerType_CirRound_Double
  case LayerType_XuXian_Circle
  case LayerType_XuXian_Line
}
class ShapeAndBezierPathDetailViewController: UIViewController {

    var layerType:LayerType?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        switch layerType!{
            case .LayerType_Shapelayer_Rect:
                self.title = "利用Shapelayer画矩形"
                //利用CAShapeLayer
                let layer = CAShapeLayer()
                layer.frame = CGRectMake(100, 100, 100, 120)
                layer.backgroundColor = UIColor.greenColor().CGColor
                layer.fillColor = UIColor.purpleColor().CGColor
                //边框颜色
                layer.strokeColor = UIColor.redColor().CGColor
                view.layer.addSublayer(layer)
            break
        case .LayerType_BezierPath_Rect:
            self.title = "利用BezierPath画矩形"
            //利用CAShapeLayer
            let path = UIBezierPath(rect: CGRectMake(100, 100, 150, 120))
            let layer = CAShapeLayer()
            layer.path = path.CGPath
            //填充颜色
            layer.fillColor = UIColor.greenColor().CGColor
            //边框颜色
            layer.strokeColor=UIColor.redColor().CGColor
            view.layer.addSublayer(layer)
            break
            case .LayerType_Shapelayer_Circle:
                 self.title = "利用Shapelayer画圆形"
                let path = UIBezierPath(roundedRect: CGRectMake(100, 150, 100, 100), cornerRadius: 50)
                let layer = CAShapeLayer()
                layer.path = path.CGPath
                layer.fillColor = UIColor.blackColor().CGColor
                layer.strokeColor = UIColor.greenColor().CGColor
                view.layer.addSublayer(layer)
             break
            case .LayerType_BezierPath_Circle:
                 self.title = "利用BezierPath画圆形"
                let radius:CGFloat = 60.0
                let startAngle:CGFloat = 0.0
                let endAngle:CGFloat = CGFloat(M_PI * 2)
                let path = UIBezierPath(arcCenter: view.center, radius: radius , startAngle: startAngle, endAngle: endAngle, clockwise: true)
                let layer = CAShapeLayer()
                layer.path = path.CGPath
                layer.fillColor = UIColor.blackColor().CGColor
                layer.strokeColor = UIColor.greenColor().CGColor
                view.layer.addSublayer(layer)
            break
            case .LayerType_CirRound:
                  self.title = "画曲线"
                let startPoint = CGPointMake(50, 300)
                let endPoint = CGPointMake(300, 300)
                let countrolPoint = CGPointMake(170, 100)
                
                let layer1 = CALayer()
                layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5)
                layer1.backgroundColor = UIColor.redColor().CGColor
                
                
                let layer2 = CALayer()
                layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5)
                layer2.backgroundColor = UIColor.redColor().CGColor
                
                
                let layer3 = CALayer()
                layer3.frame = CGRectMake(countrolPoint.x, countrolPoint.y, 5, 5)
                layer3.backgroundColor = UIColor.redColor().CGColor
                
                
                 let path = UIBezierPath()
                 let layer = CAShapeLayer()
                 path.moveToPoint(startPoint)
                 path.addQuadCurveToPoint(endPoint, controlPoint: countrolPoint)
                layer.path = path.CGPath
                layer.fillColor = UIColor.clearColor().CGColor
                layer.strokeColor = UIColor.blackColor().CGColor
                
                 view.layer.addSublayer(layer)
                 view.layer.addSublayer(layer1)
                 view.layer.addSublayer(layer2)
                 view.layer.addSublayer(layer3)
                
            break
            case .LayerType_CirRound_Double:
                self.title = "画波浪线"
                let startPoint=CGPointMake(50, 300)
                let endPoint=CGPointMake(300, 300)
                let controlPoint1=CGPointMake(120, 180)
                let controlPoint2=CGPointMake(220, 420)
                
                let layer1=CALayer()
                layer1.frame=CGRectMake(startPoint.x, startPoint.y, 5, 5)
                layer1.backgroundColor=UIColor.redColor().CGColor
                
                let layer2=CALayer()
                layer2.frame=CGRectMake(endPoint.x, endPoint.y, 5, 5)
                layer2.backgroundColor=UIColor.redColor().CGColor
                
                let layer3=CALayer()
                layer3.frame=CGRectMake(controlPoint1.x, controlPoint1.y, 5, 5)
                layer3.backgroundColor=UIColor.redColor().CGColor
                
                let layer4=CALayer()
                layer4.frame=CGRectMake(controlPoint2.x, controlPoint2.y, 5, 5)
                layer4.backgroundColor=UIColor.redColor().CGColor
                
                let path=UIBezierPath()
                let layer=CAShapeLayer()
                path.moveToPoint(startPoint)
                path.addCurveToPoint(endPoint, controlPoint1:controlPoint1, controlPoint2: controlPoint2)
                
                layer.path=path.CGPath
                layer.fillColor=UIColor.clearColor().CGColor
                layer.strokeColor=UIColor.blackColor().CGColor
                
                view.layer.addSublayer(layer)
                view.layer.addSublayer(layer1)
                view.layer.addSublayer(layer2)
                view.layer.addSublayer(layer3)
                view.layer.addSublayer(layer4)
            break
            
          case .LayerType_XuXian_Circle:
            self.title = "画虚线"
            //画虚线
             let dotteShapLayer = CAShapeLayer()
             let mdotteShapePath = CGPathCreateMutable()
             dotteShapLayer.fillColor = UIColor.clearColor().CGColor
             dotteShapLayer.strokeColor = UIColor.orangeColor().CGColor
             dotteShapLayer.lineWidth = 2.0
             CGPathAddEllipseInRect(mdotteShapePath, nil, CGRectMake(100.0, 150.0, 200.0, 200.0))
             dotteShapLayer.path = mdotteShapePath
             let arr :NSArray = NSArray(array: [10,5])
             dotteShapLayer.lineDashPhase = 1.0
             dotteShapLayer.lineDashPattern = arr as? [NSNumber]
             view.layer.addSublayer(dotteShapLayer)
             
            break
            
            case .LayerType_XuXian_Line:
                 self.title = "画虚线直线"
                //画虚线
                let dotteShapLayer = CAShapeLayer()
                let mdotteShapePath = CGPathCreateMutable()
                dotteShapLayer.fillColor = UIColor.clearColor().CGColor
                dotteShapLayer.strokeColor = UIColor.orangeColor().CGColor
                dotteShapLayer.lineWidth = 2.0
                CGPathMoveToPoint(mdotteShapePath, nil, 20, 100)
                CGPathAddLineToPoint(mdotteShapePath, nil, 20, 200)
                CGPathAddLineToPoint(mdotteShapePath, nil, 200, 200)
                dotteShapLayer.path = mdotteShapePath
                let arr :NSArray = NSArray(array: [10,5])
                dotteShapLayer.lineDashPhase = 1.0
                dotteShapLayer.lineDashPattern = arr as? [NSNumber]
                view.layer.addSublayer(dotteShapLayer)
            break
            default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
