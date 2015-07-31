//
//  ViewController.swift
//  Swift_图片轮播器
//
//  Created by iOS_DevZhangYu on 15/6/2.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//


import UIKit



class ViewController: UIViewController,UIScrollViewDelegate {
    
    lazy var zyScrollView: UIScrollView = {
    
        var tempScrollView: UIScrollView = UIScrollView()
        tempScrollView.frame = CGRectMake(10, 20, 300, 130)
        tempScrollView.delegate = self
        tempScrollView.contentSize = CGSizeMake(300 * 5, 130)
        tempScrollView.pagingEnabled = true//分页
        tempScrollView.bounces = false;//弹簧
        tempScrollView.showsHorizontalScrollIndicator = false;//水平
        tempScrollView.showsVerticalScrollIndicator = false;//垂直
        return tempScrollView;
    }()
    
    lazy var zyPageControl: UIPageControl = {
    
        var tempPageControl: UIPageControl = UIPageControl()
        tempPageControl.numberOfPages = 5
        let size:CGSize = tempPageControl .sizeForNumberOfPages(5)
        tempPageControl.bounds = CGRectMake(0, 0, size.width, size.height)
        tempPageControl.center = CGPointMake(self.view.center.x, 130)
        
        tempPageControl.pageIndicatorTintColor = UIColor .whiteColor()
        tempPageControl.currentPageIndicatorTintColor = UIColor .cyanColor()
        tempPageControl .addTarget(self, action: "pageChanged:", forControlEvents: UIControlEvents.ValueChanged)
        return tempPageControl
    }()
    
    
    var zyTimer :NSTimer!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view .addSubview(self.zyScrollView)
        self.view .addSubview(self.zyPageControl)
         for(var index :Int = 0; index < 5; index++){
            let imageString :String = "aaa\(index+1)"
            let image :UIImage = UIImage (named: imageString)!
            let imageView :UIImageView = UIImageView (frame: self.zyScrollView.frame)
            imageView.image = image
            self.zyScrollView .addSubview(imageView)
         }
        
        
        let array: NSArray = self.zyScrollView.subviews
        array.enumerateObjectsUsingBlock({ object, index, stop in
            let imageView = object as! UIImageView
            var frame: CGRect = imageView.frame
            frame.origin.x = CGFloat(index) * frame.size.width;
            imageView.frame = frame;
        })
  
        //纯scroll的轮播
        //self.starTimer()
        
        
        self.starTimerWithPageControl()
     }
    
    
    func starTimerWithPageControl(){
        self.zyTimer = NSTimer (timeInterval: 2.0, target: self, selector: "updateTimerWithPageControl", userInfo: "This is a Timer Object!", repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.zyTimer, forMode: NSRunLoopCommonModes)
    }
    
    
    func updateTimerWithPageControl(){
        
        let page: Int = (self.zyPageControl.currentPage + 1) % 5
        self.zyPageControl.currentPage = page
        
        self.pageChanged(self.zyPageControl)
        
    }
    
    func pageChanged(pageControl:UIPageControl){
        
        print("\(pageControl.currentPage)")
        
        let x:CGFloat = CGFloat(pageControl.currentPage) * self.zyScrollView.bounds.size.width
        self.zyScrollView .setContentOffset(CGPointMake(x, 0), animated: true)
    }


    func starTimer(){
    
        self.zyTimer = NSTimer (timeInterval: 2.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        NSRunLoop .currentRunLoop().addTimer(self.zyTimer, forMode: NSRunLoopCommonModes)
    }

    
    func updateTimer(){
        
        let tempFloat :Float = Float(( Int(Float(self.zyScrollView.contentOffset.x) / 300) + 1) % 5) * 300
        self.zyScrollView .setContentOffset(CGPointMake(CGFloat(tempFloat), 0), animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
    //会在scrollview停止滑动的时候执行
    //滚动试图停下来，修改页面控件的小点()
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page:CGFloat = scrollView.contentOffset.x/scrollView.bounds.size.width;
        self.zyPageControl.currentPage = Int(page)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.zyTimer .invalidate()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.starTimer()
    }
}

