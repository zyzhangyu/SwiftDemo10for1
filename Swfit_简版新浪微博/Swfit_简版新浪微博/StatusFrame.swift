//
//  StatusFrame.swift
//  Swfit_简版新浪微博
//
//  Created by iOS_DevZhangYu on 15/7/15.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//



import UIKit
import Foundation
class StatusFrame: NSObject {
    
    
    var iconF: CGRect = CGRectZero
    var nameF: CGRect = CGRectZero
    var vipF:  CGRect = CGRectZero
    var textF: CGRect = CGRectZero
    var pictureF: CGRect = CGRectZero
    
    var cellHeight : CGFloat = 0
    
    var status: ZYStatus? = nil{
    
         didSet{
            
            //0. 间距
            let padding: CGFloat = 10
            
            
            //1. 头像
            let iconX: CGFloat = padding
            let iconY: CGFloat = padding
            let iconW: CGFloat = 30
            let iconH: CGFloat = 30
            iconF = CGRectMake(iconX, iconY, iconW, iconH)
         
            
            //2. 姓名
            var nameDict: [String : AnyObject!] = [NSFontAttributeName: UIFont(name: "Helvetica", size: 14.0)]
            let maxF = CGFloat(MAXFLOAT)
            let nameSize = CGSizeMake(maxF, maxF)
            var nameFrame = status?.name.textRect(nameSize, attributes: nameDict)
            nameFrame?.origin.x = CGRectGetMaxX(iconF) + padding
            nameFrame?.origin.y = padding + (iconF.height - nameFrame!.height) * 0.5
            nameF = nameFrame!
            
            
            //3. vip图标
            let vipX: CGFloat = CGRectGetMaxX(nameF) + padding
            let vipY: CGFloat = nameF.origin.y
            let vipW: CGFloat = 14
            let vipH: CGFloat = 14
            vipF = CGRectMake(vipX, vipY, vipW, vipH)
            
            
            //4. 正文
            var textDict: [String : AnyObject!] = [NSFontAttributeName: UIFont(name: "Helvetica", size: 16.0)]
            let textSize = CGSizeMake(300, maxF)
            var textFrame = status?.text.textRect(CGSizeMake(300, maxF), attributes: textDict)
            textFrame?.origin.x = padding
            textFrame?.origin.y = CGRectGetMaxY(iconF) + padding
            textF = textFrame!
            
            
            //5. 配图
            
            
            if( status?.picture != nil ){
                
                
                if(status?.picture?.length>0) {
                let pictureX: CGFloat = padding
                let pictureY: CGFloat = CGRectGetMaxY(textF) + padding
                let pictureW: CGFloat = 100
                let pictureH: CGFloat = 100
                pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH)
                
                cellHeight = CGRectGetMaxY(pictureF) + padding
                }else{
                    pictureF = CGRectZero
                    cellHeight = CGRectGetMaxY(textF) + padding

                }
                
                
            } else {
                cellHeight = CGRectGetMaxY(textF) + padding
            }

            
        }
    }
    
    
    
    class func statusFrames() -> (NSArray){
        
        
        var array: NSArray = NSArray (contentsOfFile: NSBundle .mainBundle() .pathForResource("statuses", ofType: "plist")!)!
        var arrayM: NSMutableArray = NSMutableArray ()
        for var index = 0 ;index < array.count; ++index{
            
            let dictionary: NSDictionary = array[index] as! NSDictionary
            let statusFrame: StatusFrame = StatusFrame()
            statusFrame.status = ZYStatus (dictionary: dictionary)
            
            arrayM .addObject(statusFrame)
        }
        
        return arrayM
    }
}
