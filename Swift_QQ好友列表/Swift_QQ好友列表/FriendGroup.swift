//
//  FriendGroup.swift
//  Swift_QQ好友列表
//
//  Created by iOS_DevZhangYu on 15/7/31.
//  Copyright © 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class FriendGroup: NSObject {
    
    var name = ""
    var friends:[Frined] = []
    var onlime:Int = 0
    var isOpend:Bool = false
    
    
    class func groupdWithDict(dictionary: NSDictionary) -> (FriendGroup){
        
        return FriendGroup(dictionary: dictionary)
    }
    
    init(dictionary: NSDictionary) {
        
        super.init()
        
        name = dictionary["name"] as! String
        friends = dictionary["friends"] as! [Frined]
//        onlime = dictionary["onlime"] as! Int
        
        onlime = 3
        isOpend = false
    }
    
    override init() {
        super.init()
    }

}
