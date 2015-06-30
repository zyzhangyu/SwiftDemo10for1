//
//  ZYTgFooterView.swift
//  Swift_团购tableview
//
//  Created by iOS_DevZhangYu on 15/6/24.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

protocol ZYTgFootViewDelegate : NSObjectProtocol{
    // protocoldefinition goes here
    
    
    func tgFooterViewDidDownloadButtonClick(footview : ZYTgFooterView) -> ()
    
}


class ZYTgFooterView: UIView {

    @IBOutlet weak var loadMoreButton: UIButton!
    
    
    weak var delegate: ZYTgFootViewDelegate?
    
    @IBOutlet weak var tipView: UIView!
    
    
    @IBAction func loadMore(sender: UIButton) {
        
        loadMoreButton.hidden = true
        tipView.hidden = false
        
        
        delegate! .tgFooterViewDidDownloadButtonClick(self)
    }
    
    class func footView() -> ZYTgFooterView {
        
        let array: NSArray =  NSBundle .mainBundle() .loadNibNamed("ZYTgFooterView", owner: nil, options: nil)
        
        return array.lastObject as! ZYTgFooterView
    }
    
    func endRefresh() ->(){
        
        loadMoreButton.hidden = false
        tipView.hidden = true
    }

}
