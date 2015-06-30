//
//  ZYTgModal.swift
//  Swift_团购tableview
//
//  Created by iOS_DevZhangYu on 15/6/19.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

 class ZYTgModal: NSObject {

    var title: String = ""
    var icon: String = ""
    var price: String = ""
    var buyCount: String = ""
    
    init(dictionary: NSDictionary){
    
        super.init()
        
        self .setValuesForKeysWithDictionary(dictionary as [NSObject : AnyObject])
    }
    
    
    class func tgWithDict(dictionary : NSDictionary) -> ZYTgModal {
        
        return ZYTgModal(dictionary: dictionary)
    }
    
    class func tgs() -> NSMutableArray{
        
        let pathStr: String =  NSBundle .mainBundle() .pathForResource("tgs.plist", ofType: nil)!
        let zyArray: NSArray = NSArray (contentsOfFile: pathStr)!
        
        var arrayM: NSMutableArray = NSMutableArray ()
        
        for tempDict in zyArray{
            
            let zyModal =  ZYTgModal .tgWithDict(tempDict as! NSDictionary)
            
            arrayM .addObject(zyModal)
        }
        
        return arrayM
    }
    
    
//    class func carGroups()->NSMutableArray{
//        
//        let pathStr: String = NSBundle .mainBundle() .pathForResource("cars_total.plist", ofType: nil)!
//        let array: NSArray = NSArray (contentsOfFile: pathStr)!
//        
//        var arrayM: NSMutableArray = NSMutableArray ()
//        
//        for object in array{
//            
//            arrayM .addObject(ZYCarGroup .carGroupWithDictionary(object as! NSDictionary))
//        }
//        return arrayM
//    }


}
