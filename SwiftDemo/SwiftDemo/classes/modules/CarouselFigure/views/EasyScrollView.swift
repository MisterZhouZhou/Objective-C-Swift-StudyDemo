//
//  EasyScrollView.swift
//  swift-demo
//
//  Created by rayootech on 16/4/12.
//  Copyright © 2016年 rayootech. All rights reserved.
//

import UIKit

@objc protocol EasyScrollViewDelegate{
    func EasyScrollViewDidClicked(index:Int)
}

class EasyScrollView: UIView ,UIScrollViewDelegate{

    weak var delegate :EasyScrollViewDelegate?
    var imageArray :NSMutableArray?
    //scrollView
    var scrollView : UIScrollView?
    //pagecontrol
    var pageControl:UIPageControl?
    //NSTimer
    var timer :NSTimer?
    //当前下标
    var currentPageIndex:NSInteger?
    
    //纠正偏移量
    let offsetY:CGFloat = 64
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.greenColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initScrollview(imageArr:NSArray){
        
        currentPageIndex = 0
        imageArray = NSMutableArray(array: imageArr)
        imageArray?.insertObject(imageArr.lastObject!, atIndex: 0)
        imageArray?.addObject(imageArr.firstObject!)
        
        let _width = self.bounds.size.width
        let _height = self.bounds.size.height
        
        //scrollView
        scrollView = UIScrollView(frame: self.bounds)
        scrollView?.delegate = self
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.showsVerticalScrollIndicator = true
        scrollView?.pagingEnabled = true
        scrollView?.backgroundColor = UIColor.redColor()
        scrollView?.bounces = false
        //遍历数组
        for (i,value) in (imageArray?.enumerate())! {
           let imageView = UIImageView(frame: CGRectMake(_width * CGFloat(i),-offsetY,_width,_height))
           let bannerString = imageArray?.objectAtIndex(i)
            if ((bannerString?.hasPrefix("http")) != nil){
              imageView.image = UIImage(named: bannerString as! String)
            }
            else{
              imageView.sd_setImageWithURL(NSURL(string: bannerString as! String), placeholderImage: UIImage(named: "xx"))
            }
            imageView.tag = i
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapHander:")))
            scrollView?.addSubview(imageView)
        }
        scrollView?.contentOffset = CGPointMake(_width, 0)
        scrollView?.contentSize = CGSizeMake(_width * CGFloat((imageArray?.count)!), 0)
        
       //pageControl
        pageControl = UIPageControl(frame: CGRectMake(0, _height - 30, _width, 30))
        pageControl!.currentPageIndicatorTintColor = UIColor(red: 240/255, green: 60/255, blue: 70/255, alpha: 1)
        pageControl!.pageIndicatorTintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
        pageControl!.numberOfPages = imageArr.count;
        pageControl!.currentPage = 0;
        pageControl?.addTarget(self, action: Selector("pageControlChange"), forControlEvents: .ValueChanged)
        pageControl?.updateCurrentPageDisplay()
       
        self.addSubview(scrollView!)
        self.addSubview(pageControl!)
    
        if (pageControl!.numberOfPages == 1) {
            pageControl!.hidden = true
            scrollView!.scrollEnabled = false
        } else {
            pageControl!.hidden = false
            scrollView!.scrollEnabled = true
//            if timer == nil{
//              timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("showNextImages"), userInfo: nil, repeats: true)
//            }
        }
        
    }
    
    func pageControlChange(){
        currentPageIndex = pageControl!.currentPage;
        scrollView!.setContentOffset(CGPointMake(self.bounds.size.width * CGFloat(pageControl!.currentPage), 0), animated: false)
    }
    
    func tapHander(tap:UITapGestureRecognizer){
        if (self.delegate != nil ){
            if (tap.view!.tag == imageArray!.count - 1) {
                delegate!.EasyScrollViewDidClicked(0);
                return;
            }
            
            if (tap.view!.tag == 0) {
                delegate!.EasyScrollViewDidClicked(imageArray!.count - 2);
                return;
            }
            delegate!.EasyScrollViewDidClicked(tap.view!.tag - 1);
        }
    }
    
    //
    func showNextImages(){
        if (imageArray!.count > 3) {
            let pageWidth = scrollView!.contentOffset.x + (scrollView?.bounds.size.width)!;
            if (scrollView?.contentOffset.x < (CGFloat(imageArray!.count-1) * scrollView!.bounds.size.width) ) {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.scrollView!.contentOffset = CGPointMake(pageWidth, -self.offsetY);
                })
            } else {
                scrollView!.contentOffset = CGPointMake(self.bounds.size.width, -self.offsetY);
            }
            
            let width = self.bounds.size.width
            
           currentPageIndex = Int((scrollView!.contentOffset.x - width / 2) / width) + 1
            pageControl!.currentPage = currentPageIndex! - 1;
            
            if (currentPageIndex == imageArray!.count - 1) {
                pageControl!.currentPage = 0;
            }
            
            if (currentPageIndex == 0) {
                pageControl!.currentPage = imageArray!.count - 2;
            }
      }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if((timer?.valid) != nil){
            timer?.fireDate = NSDate(timeInterval: 4, sinceDate: NSDate())
        }
        
         let width = self.bounds.size.width
        currentPageIndex = Int((scrollView.contentOffset.x - width / 2) / width) + 1;
        
        pageControl?.currentPage = currentPageIndex! - 1;
        
        if (currentPageIndex == imageArray!.count - 1) {
            pageControl!.currentPage = 0;
        }
        
        if (currentPageIndex == 0) {
            pageControl!.currentPage = imageArray!.count - 3;
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let width = self.bounds.size.width
        if (currentPageIndex == 0) {
            scrollView.setContentOffset(CGPointMake(CGFloat(imageArray!.count-2) * width, 0), animated: false)
        }
        
        if (currentPageIndex == imageArray!.count - 1) {
            currentPageIndex = -1;
            scrollView.setContentOffset(CGPointMake(width, -offsetY), animated: false)
        }
    }
    
    override func willMoveToWindow(newWindow: UIWindow?) {
        if (newWindow != nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("showNextImages"), userInfo: nil, repeats: true)
        }
        else {
            timer?.invalidate()
            timer = nil;
        }
    }
    
    
}
