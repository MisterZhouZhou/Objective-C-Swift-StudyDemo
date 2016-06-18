//
//  ShapeAndBezierPathViewController.swift
//  swift-demo
//
//  Created by rayootech on 16/4/14.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ShapeAndBezierPathViewController: ZWBaseViewController ,UITableViewDelegate,UITableViewDataSource {
    var dataArray :NSArray = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()

       self.title = "CAShapeLayer&UIBezierPath操作"
        let tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        
        dataArray = ["CAShaperLayer画矩形","UIBezierPath画矩形","CAShaperLayer画圆","UIBezierPath画圆","画曲线","画波浪曲线","画虚线圆","画虚线直线"]
    }

    /**
     UITableViewDelegate
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        cell?.accessoryType = .DisclosureIndicator
        cell?.textLabel?.text = "\(dataArray[indexPath.row])"
        cell?.selectionStyle = .None
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          let vc = ShapeAndBezierPathDetailViewController()
        switch indexPath.row{
        case 0:
            vc.layerType = LayerType.LayerType_Shapelayer_Rect
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
             vc.layerType = LayerType.LayerType_BezierPath_Rect
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
           
            vc.layerType = LayerType.LayerType_Shapelayer_Circle
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            vc.layerType = LayerType.LayerType_BezierPath_Circle
            self.navigationController?.pushViewController(vc, animated: true)
            break

        case 4:
            vc.layerType = LayerType.LayerType_CirRound
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 5:
            vc.layerType = LayerType.LayerType_CirRound_Double
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 6:
            vc.layerType = LayerType.LayerType_XuXian_Circle
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 7:
            vc.layerType = LayerType.LayerType_XuXian_Line
            self.navigationController?.pushViewController(vc, animated: true)
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
