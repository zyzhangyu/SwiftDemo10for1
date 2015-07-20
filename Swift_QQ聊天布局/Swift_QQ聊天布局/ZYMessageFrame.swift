//
//  ZYMessageFrame.swift
//  Swift_QQ聊天布局
//
//  Created by iOS_DevZhangYu on 15/7/17.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

let screenW = UIScreen .mainScreen().bounds.size.width
let screenH = UIScreen .mainScreen().bounds.size.height


class ZYMessageFrame: NSObject {
    
    let padding: CGFloat = 10
    let textPadding: CGFloat = 20
    var textF: CGRect = CGRectZero
    var timeF: CGRect = CGRectZero
    var iconF: CGRect = CGRectZero
    var cellHeight: CGFloat = 0
    
    let maxF = CGFloat(MAXFLOAT)

    
    var message: ZYMessage? = nil{
        
        didSet{
        
            
            //1. 时间
            if(message?.hideTime == false) {
            
                let timeX: CGFloat = 0
                let timeY: CGFloat = 0
                let timeW: CGFloat = 320
                let timeH: CGFloat = 44

                timeF = CGRectMake(timeX, timeY, timeW, timeH)
            }
            
            //2. 头像
            var iconX: CGFloat = 0
            let iconY: CGFloat = CGRectGetMaxY(timeF) + padding
            let iconW: CGFloat = 50
            let iconH: CGFloat = 50
            switch(message!.type) {
            case .MessageModelGatsby:
                    iconX = screenW - iconW - self.padding
            case .MessageModelJobs:
                    iconX = self.padding
            }
             iconF = CGRectMake(iconX, iconY, iconW, iconH)
            
            
            let abc: NSString = "qqqqqq"
            
            
            //3. 正文
            var textSize = message!.text.boundingRectWithSize(CGSizeMake(150, maxF), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont .systemFontOfSize(15)], context: nil).size
            
            var lastBtnSize = CGSizeMake(textSize.width + textPadding * 2, textSize.height + textPadding * 2)
            
            var textX: CGFloat = 0
            var textY: CGFloat = iconY
            switch message!.type{
                
            case .MessageModelGatsby:
                    textX = iconX - padding - lastBtnSize.width
            case .MessageModelJobs:
                    textX = CGRectGetMaxX(iconF) + padding
            }

             textF = CGRectMake(textX, textY, lastBtnSize.width, lastBtnSize.height)
            
            //4.  cell的高度
            var iconMaxY = CGRectGetMaxY(iconF)
            var textMaxY = CGRectGetMaxY(textF)
            cellHeight = max(iconMaxY, textMaxY)
        }
    }

}


