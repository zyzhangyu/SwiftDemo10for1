//
//  Frined.swift
//  Swift_QQ好友列表
//
//  Created by iOS_DevZhangYu on 15/7/31.
//  Copyright © 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class Frined: NSObject {

    var name = ""
    var icon = ""
    var intro = ""
    var vip = false
    
    class func friendWithDict(dictionary: NSDictionary) -> (Frined){
        
        return Frined(dictionary: dictionary)
    }
    

    init(dictionary: NSDictionary) {
        
        super.init()
        
        name = dictionary["name"] as! String
        icon = dictionary["icon"] as! String
        intro = dictionary["intro"] as! String
        vip = false
        
    }
    
    override init() {
        super.init()
    }
}
