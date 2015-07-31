//
//  ZYHero.swift
//  Swift_LOL Hero
//
//  Created by iOS_DevZhangYu on 15/6/9.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYHero: NSObject {
    
    var name: String = ""
    var icon: String = ""
    var intro: String = ""
    
    
    init(zyDictionary: NSDictionary ) {
        
        super.init()

        self .setValuesForKeysWithDictionary(zyDictionary as! [String : String])
     
    }
    
    class func heros() -> NSArray{
        let bundle: NSBundle = NSBundle .mainBundle()
        
        let array: NSArray = NSArray (contentsOfFile: NSBundle .mainBundle() .pathForResource("heros.plist", ofType: nil)!)!
        
        print("打印英雄数组: %@",array)
        
        let arrayM: NSMutableArray = NSMutableArray ()
        
        for object in array{
            
            arrayM .addObject(ZYHero .heroWithDict(object as! NSDictionary))
        }
       
        return array
        
    }
    
    class func heroWithDict(zydictionary: NSDictionary)-> ZYHero {
        
        
        return ZYHero (zyDictionary: zydictionary)
        
    }
    
    

}
