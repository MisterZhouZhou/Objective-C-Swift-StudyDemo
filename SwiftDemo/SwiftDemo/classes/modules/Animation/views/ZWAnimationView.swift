//
//  ZWAnimationView.swift
//  swift-demo
//
//  Created by rayootech on 16/4/13.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit
enum AnitationType {
   case AnitationType_Point  //画点
   case AnitationType_Line  //画直线
   case AnitationType_Circle //画圆
   case AnitationType_String //画字符串
   case AnitationType_Image //画图片
   case AnitationType_Path //Path画图
}
class ZWAnimationView: UIView {
   
   var anitationType :AnitationType?
   override func drawRect(rect: CGRect) {
      super.drawRect(rect)
    
    //获取画笔上下文
    let context:CGContextRef = UIGraphicsGetCurrentContext()!
    //抗锯齿设置
    CGContextSetAllowsAntialiasing(context, true)
    
    switch self.anitationType!{
    
        case .AnitationType_Point:
              CGContextFillEllipseInRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.width))
              //关闭路径
              CGContextStrokePath(context)
        case .AnitationType_Line:
           //画直线
           CGContextSetLineWidth(context, 5)//设置画笔的宽度
           CGContextMoveToPoint(context, 10, 20)
           CGContextAddLineToPoint(context, 100, 100)
           CGContextStrokePath(context)
        case .AnitationType_Circle:
           //画弧
           CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
           CGContextAddArc(context, self.center.x, self.center.y, 50, 0, CGFloat(360*M_PI/180), 0)
           CGContextStrokePath(context)
        case .AnitationType_String:
            let string:NSString  = "hello world!"
            string.drawAtPoint(CGPointMake(10, 30), withAttributes: nil)
        case  .AnitationType_Image:
            CGContextSetShadow(context, CGSizeMake(3, 3), 10)
            var image = UIImage(named: "beijing")
            image = self.scaleImage(image!)
            image?.drawAtPoint(CGPointMake(0, 0))
            CGContextSetShadow(context, CGSizeMake(0, 0), 0)
        case .AnitationType_Path:
            //使用path画图
            let p1:CGMutablePathRef = CGPathCreateMutable()
            CGPathMoveToPoint(p1, nil, 0, 0)
            CGPathAddLineToPoint(p1, nil, 50, 50)
            CGPathAddLineToPoint(p1, nil, 100, 0)
            CGContextAddPath(context, p1)
            CGContextStrokePath(context)
        default: break
    }
    
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //对图片进行缩小
    func scaleImage(var image:UIImage)->UIImage{
        // 设定需要修改的图片的大小，这里设定为新图片宽是120，高是90.
        
        let sizeChange = CGSize(width: 110,height: 100)
        
        // 打开图片编辑模式
        UIGraphicsBeginImageContextWithOptions(sizeChange, false, 0.0)
        
        // 修改图片长和宽
        
        image.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        // 生成新图片
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭图片编辑模式
        
        UIGraphicsEndImageContext()
        
        // 压缩图片
        
        let imageSmall = UIImageJPEGRepresentation(image, 0.1)
        
        return UIImage(data: imageSmall!, scale: 1)!
    }
    
    
}
