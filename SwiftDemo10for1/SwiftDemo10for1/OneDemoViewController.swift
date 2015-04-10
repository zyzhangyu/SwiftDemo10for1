//
//  OneDemoViewController.swift
//  SwiftDemo10for1
//
//  Created by iOS_DevZhangYu on 15/4/10.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class OneDemoViewController: UIViewController {


    
    @IBOutlet weak var imView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftFrame = CGRectMake(0, 0, 30, 30)
        let rightFrame = CGRectMake(0, 0, 30, 30)
        let topFrame = CGRectMake(0, 0, 30, 30)
        let bottomFrame = CGRectMake(0, 0, 30, 30)
        let frameArray  : [CGRect] = [leftFrame,rightFrame,topFrame,bottomFrame]
        
        //center's center (50,250)
        let leftPoint = CGPointMake(20, 250)
        let rightPoint = CGPointMake(80, 250)
        let bottomPoint = CGPointMake(50, 220)
        let topPoint = CGPointMake(50, 280)
        let pointArray : [CGPoint] = [leftPoint,rightPoint,topPoint,bottomPoint]
        
        let btnTitleArray = ["左","右","上","下"]

        
        for var index = 0; index < 4; ++index {
            let button = UIButton.buttonWithType(.System) as! UIButton
            button.backgroundColor = UIColor.redColor()
            button.frame = frameArray[index]
            button.center = pointArray[index]
            button.tintColor = UIColor.cyanColor()
            button  .setTitle(btnTitleArray[index], forState: UIControlState.Normal)
            button .addTarget(self, action:"move:", forControlEvents: UIControlEvents.TouchUpInside)
            button.tag = index + 40;
            self.view .addSubview(button)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func move(sender:UIButton){
        
        var center:CGPoint = imView.center;
        
        switch sender.tag{
        case 40:
            center.x -= 20
        case 41:
            center.x += 20
        case 42:
            center.y -= 20
        case 43:
            center.y += 20
        default:
            break
        }
        
        UIView .beginAnimations(nil, context: nil)
        imView.center = center;
        UIView .setAnimationDuration(1.0)
        UIView .commitAnimations()
        
        
        //方式二：使用transform，建议使用
        //        imView.transform = CGAffineTransformIdentity
        
        
        
    }
    
    @IBAction func zoom(sender: UIButton) {
        
        //方式1：使用frame,本人不建议使用frame，换成bound会好很多，但是还是建议使用transform
        /*
        
        var imViewFrame:CGRect = imView.frame;
        if(sender.tag == 45){
        imViewFrame.size.height += 30;
        imViewFrame.size.width += 30;
        }else{
        imViewFrame.size.height -= 30;
        imViewFrame.size.width -= 30;
        }
        
        UIView .beginAnimations(nil, context: nil)
        imView.frame = imViewFrame
        UIView .setAnimationDuration(1.0)
        UIView .commitAnimations()
        */
        
        
        //方式二: 使用transform，建议使用
        
        var sx,sy:CGFloat
        if(sender.tag == 45){
            sx = 1.2
            sy = sx
        }else{
            sx = 0.8
            sy = sx
        }
        
        UIView .beginAnimations(nil, context: nil)
        imView.transform = CGAffineTransformScale(imView.transform, sx, sy)
        UIView .setAnimationDuration(1.0)
        UIView .commitAnimations()
        
        
    }
    
    @IBAction func rotation(sender  : UIButton) {
        
        var angle:Double
        if(sender.tag == 47){
            angle = -M_PI_4
        }else{
            angle = +M_PI_4
        }
        
        
        UIView .beginAnimations(nil, context: nil)
        imView.transform = CGAffineTransformRotate(imView.transform, CGFloat(angle))
        UIView .setAnimationDuration(1.0)
        UIView .commitAnimations()
        
    }
    
    
    @IBAction func propeller(sender: UIButton) {
        
        imView.bounds = CGRectMake(0, 0, 200, 60)
        self .rotation(sender)
        
    }

    @IBAction func goBack(sender: AnyObject) {
        
        self .dismissViewControllerAnimated(true, completion: nil)
    }
}
