//
//  ZYMessage.swift
//  Swift_QQ聊天布局
//
//  Created by iOS_DevZhangYu on 15/7/17.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

enum MessageModelType{
    case MessageModelGatsby
    case MessageModelJobs
}


class ZYMessage: NSObject {
   
    
    override init(){
        
        super.init()
    }
    
    var text:NSString = ""
    var time:NSString = ""
    var hideTime: Bool = false
    var type: MessageModelType = MessageModelType.MessageModelGatsby
    
    init(dictionary: NSDictionary) {
        
        super.init()
        
        
        text = dictionary .objectForKey("text") as! NSString
        
        time = dictionary .objectForKey("time") as! NSString
        
        let value: NSNumber = dictionary .objectForKey("type") as! NSNumber
        if(value == 0){
            type = MessageModelType.MessageModelGatsby
        }else{
            type = MessageModelType.MessageModelJobs
        }
        
        
        
//        self .setValuesForKeysWithDictionary(dictionary as [NSObject : AnyObject])
        
//        self .setValuesForKeysWithDictionary(dictionary as NSDictionary as [NSObject : AnyObject] )

    }

    class func messageWithDict(dictionary: NSDictionary) -> ZYMessage{
        
        return ZYMessage(dictionary: dictionary)
    }
    

}
