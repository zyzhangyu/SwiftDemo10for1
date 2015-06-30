//
//  ViewController.swift
//  Swift_ScrollView
//
//  Created by iOS_DevZhangYu on 15/5/20.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    lazy var zyScrollView: UIScrollView = {
    
        var tempScrollView: UIScrollView = UIScrollView()
        
        tempScrollView.frame =  self.view.frame
        
        
        tempScrollView.delegate = self
        //设置边距
        tempScrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20)
        //不显示水平滚动标示

        tempScrollView.showsHorizontalScrollIndicator = false
        //不显示垂直滚动标示

        tempScrollView.showsVerticalScrollIndicator = false
        
        //设置偏移
        // *** 偏移位置
        tempScrollView.contentOffset = CGPointMake(0, -100)

        // 取消弹簧效果，内容固定，不希望出现弹簧效果时
        // 不要跟bounds属性搞混了
        tempScrollView.bounces = false
        
        // 设置最大/最小缩放比例
        tempScrollView.minimumZoomScale = CGFloat(0.2)
        tempScrollView.maximumZoomScale = CGFloat(2.0)
        
        
        tempScrollView.backgroundColor = UIColor .cyanColor()
        
        return tempScrollView
    }()
    
    
    
    lazy var zyImageView: UIImageView = {
    
        var tempImage: UIImageView = UIImageView()
        
        tempImage.image = UIImage(named: "qwewqe")!
        
        // 让图像视图根据图像自动调整大小
        tempImage .sizeToFit()
        
        return tempImage
    }()
    
    
    
    lazy var zyButton:UIButton = {
    
        var tempButton: UIButton = UIButton()
        tempButton.frame = CGRectMake(30, 30, 50, 50)
        tempButton.backgroundColor = UIColor.redColor()
        tempButton .addTarget(self, action: "click:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        return tempButton
    }()
    
 
    
    
    
    
    func click(id:UIButton){
        
        
        var offset: CGPoint = zyScrollView.contentOffset;
        offset.x += 20
        offset.y += 20
        
        zyScrollView.contentOffset = offset
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view .addSubview(zyScrollView)
        zyScrollView .addSubview(zyImageView)
        
        zyScrollView.contentSize = zyImageView.image!.size
        self.view .addSubview(zyButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    /**
    1> 设置了代理
    2> 指定了最大、最小的缩放比例
    
    表示ScrollView是可以缩放的
    
    代理方法的"返回值"实际上就是控制器告诉滚动视图，要缩放的是UIImageView
    */
    // 告诉ScrollView要缩放的视图是谁，具体的缩放实现，是由ScrollView来完成的
    // 1> scrollView要知道缩放谁


    
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.zyImageView;
    }
    
    // 2> 滚动视图即将开始缩放，通常不需要写
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
        println(__FUNCTION__)
    }
    
    // 3> 正在缩放，通常也不需要实现
    func scrollViewDidZoom(scrollView: UIScrollView) {
        println(__FUNCTION__)
        
        println(NSStringFromCGAffineTransform(zyImageView.transform))
        
     }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        println(__FUNCTION__)
    }
    
    

}

