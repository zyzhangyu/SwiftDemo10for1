//
//  ZYCar.swift
//  Swift_汽车品牌
//
//  Created by iOS_DevZhangYu on 15/6/10.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYCar: NSObject {
   
    var name: String = ""
    var icon: String = ""
    
    init(dictionary: NSDictionary ){
        
        super.init()
        
        self .setValuesForKeysWithDictionary(dictionary as [NSObject : AnyObject])
    }
    
    class func carWithDict(dictionary: NSDictionary)->ZYCar{
        
        return ZYCar (dictionary: dictionary)
    }

    class func carsWithArray(array: NSArray)->NSMutableArray{
    
        var tempArray: NSMutableArray = NSMutableArray()
        for object in array{
            tempArray .addObject(ZYCar .carWithDict(object as!NSDictionary))
        }
        return tempArray
    }
}
