//
//  DrawCircleViewController.swift
//  swift-demo
//
//  Created by rayootech on 16/4/12.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import Foundation
import UIKit
class DrawCircleViewController: ZWBaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var collection:UICollectionView?
    
    //数据源
    var dataArray = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基本图形"
        
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width/2-10, 110)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing  = 5
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collection?.dataSource = self
        collection?.delegate = self
        collection?.backgroundColor = UIColor.whiteColor()
        collection?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "anitationCell")
        self.view.addSubview(collection!)
        
        //数据源
        dataArray = [AnitationType.AnitationType_Point,AnitationType.AnitationType_Line,AnitationType.AnitationType_Circle,AnitationType.AnitationType_String,AnitationType.AnitationType_Image,AnitationType.AnitationType_Path]

    }

    
    /**
     UICollectionViewDelegate
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return dataArray.count
    }
   
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let ID = "anitationCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath)
        let type  = dataArray[indexPath.row] as? AnitationType
        let zw = ZWAnimationView()
        switch type!{
          case .AnitationType_Point:
            zw.frame = CGRectMake(50,50,10,10)
          break
            
          default:
            zw.frame = CGRectMake(0,0,self.view.frame.size.width/2,110)
          break
        }
        zw.anitationType = dataArray[indexPath.row] as? AnitationType
        cell.contentView.addSubview(zw)
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.layer.borderWidth = 0.5
        cell.layer.masksToBounds = true
        return cell
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
