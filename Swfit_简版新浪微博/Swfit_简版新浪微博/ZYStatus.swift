//
//  ZYStatus.swift
//  Swfit_简版新浪微博
//
//  Created by iOS_DevZhangYu on 15/7/15.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYStatus: NSObject {
    
    var name = ""
    var icon = ""
    var text = ""
    var picture: NSString?
    var vip = false
    
    
    
    init(dictionary: NSDictionary) {
        super.init()
        
        self .setValuesForKeysWithDictionary(dictionary as [NSObject : AnyObject])
        
        
    }
    
    class func statusWithDict(dictionary: NSDictionary) -> ZYStatus{
    
        return ZYStatus(dictionary: dictionary)
    }
   
}
