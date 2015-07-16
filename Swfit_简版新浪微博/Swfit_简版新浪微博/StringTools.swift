//
//  StringTools.swift
//  Swfit_简版新浪微博
//
//  Created by iOS_DevZhangYu on 15/7/15.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import Foundation
import UIKit
extension String {
    
    func textRect(size: CGSize, attributes: Dictionary <String, AnyObject>) -> CGRect {
        
        return self.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes as [String : AnyObject], context: nil)
    }
}


 