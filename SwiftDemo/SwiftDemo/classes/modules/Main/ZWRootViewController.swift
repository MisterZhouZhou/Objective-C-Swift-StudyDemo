//
//  ZWRootViewController.swift
//  Swift-Demo
//
//  Created by rayootech on 16/6/2.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

class ZWRootViewController: ZWBaseViewController ,UITableViewDataSource,UITableViewDelegate {

    var dataArray:Dictionary<String,String> = Dictionary<String,String>()
    //UITableView
    lazy var mainTableView: UITableView = {
        
        let tempTableView = UITableView (frame: CGRectZero, style: UITableViewStyle.Plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //添加视图
        self .addSubVies()
        
        //设置布局
        self .layout()
       
    }
    
    //添加视图
    func addSubVies ()
    {
        //添加UITableView
        self.view.addSubview(self.mainTableView)
        //去除底部多余线
        self.mainTableView.tableFooterView = UIView()
    }
    
    //设置布局
    func layout()
    {
        self.mainTableView.snp_makeConstraints { (make) in
            make.left.top.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(self.view)
        }
    }
    
    
    //UITableView DataSource ,Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        let dict:Dictionary<String,String> = self.dataArray
        for (index,value) in dict.keys.enumerate(){
            if index == indexPath.row {
                 cell.textLabel?.text = value
            }
        }
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var  vcStr :String = String()
        
        let dict:Dictionary<String,String> = self.dataArray
        for (index,value) in dict.values.enumerate(){
            if index == indexPath.row {
                vcStr = value
            }
        }
        //进行跳转
        self.navigationController!.pushViewControllerWithName(vcStr)
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
