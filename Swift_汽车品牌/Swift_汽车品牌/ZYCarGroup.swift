//
//  ZYCarGroup.swift
//  Swift_汽车品牌
//
//  Created by iOS_DevZhangYu on 15/6/10.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYCarGroup: NSObject {
    
    var title: String = ""
    var cars: NSArray = NSArray ()
    
    init(dictionary: NSDictionary){
      
        super.init()
        
        self .setValue(dictionary["title"], forKey: "title")
        self.cars = ZYCar .carsWithArray(dictionary["cars"] as! NSArray)

    }
    
    class func carGroupWithDictionary(dictionary: NSDictionary)->ZYCarGroup{
        
        return ZYCarGroup (dictionary: dictionary)
    }
    
    class func carGroups()->NSMutableArray{
        
        let pathStr: String = NSBundle .mainBundle() .pathForResource("cars_total.plist", ofType: nil)!
        let array: NSArray = NSArray (contentsOfFile: pathStr)!
        
        var arrayM: NSMutableArray = NSMutableArray ()
        
        for object in array{
            
            arrayM .addObject(ZYCarGroup .carGroupWithDictionary(object as! NSDictionary))
        }
        return arrayM
    }
}
