//
//  ZYHeaderView.swift
//  Swift_QQ好友列表
//
//  Created by iOS_DevZhangYu on 15/7/31.
//  Copyright © 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

protocol ZYHeaderViewDelegate: NSObjectProtocol{
    
    func headerViewDidClickedNameView(headerView: ZYHeaderView) ->()
    
}


class ZYHeaderView: UITableViewHeaderFooterView {

    weak var delegate: ZYHeaderViewDelegate?
    
    var countView: UILabel = UILabel()
    var nameView: UIButton = UIButton()
    
    var group: FriendGroup? = nil{
    
        didSet{
            
            
            
            
            nameView .setTitle(group!.name, forState: UIControlState.Normal)
            
             let bac = 123
            countView.text = "\(bac)"
        
        }
    }
    
    
    class func headerViewWithTableView(tableView: UITableView) -> (ZYHeaderView) {
        
        let headerID  = "header"
        
        var header: ZYHeaderView? = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headerID) as? ZYHeaderView
        
        if(header == nil){
            
            header = ZYHeaderView()
        }
        return header!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
            nameView = UIButton (type: UIButtonType.Custom)
            nameView .setBackgroundImage(UIImage (named: "buddy_header_bg"), forState: UIControlState.Normal)
            nameView .setBackgroundImage(UIImage(named: "buddy_header_bg_highlighted"), forState: UIControlState.Highlighted)
            nameView .setImage(UIImage(named: "buddy_header_arrow"), forState: UIControlState.Normal)
            nameView .setTitleColor(UIColor .blackColor(), forState: UIControlState.Normal)
            nameView .contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            nameView .titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            nameView .contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            nameView .addTarget(self, action: "nameViewClick", forControlEvents: UIControlEvents.TouchUpInside)
            nameView .imageView?.contentMode = UIViewContentMode.Center
            nameView .imageView?.clipsToBounds = true
            self.contentView .addSubview(nameView)
        
            countView.textAlignment = NSTextAlignment.Right
            countView.textColor = UIColor.grayColor()
            self.contentView .addSubview(countView)
        
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.nameView.frame = self.bounds
        
        let countY:CGFloat = 0
        let countH:CGFloat = self.frame.size.height
        let countW:CGFloat = 150
        let countX:CGFloat = self.frame.size.width - 10 - countW
        self.countView.frame = CGRectMake(countX, countY, countW, countH)

    }
    
    
    func nameViewClick() -> (){
        
        (self.group!.isOpend = !self.group!.isOpend )
        
        delegate! .headerViewDidClickedNameView(self)
        
    }
    
    override func didMoveToSuperview() {
        
        if(self.group!.isOpend){
            
           
            self.nameView.imageView!.transform = CGAffineTransformMakeRotation( CGFloat(M_PI_2) );

        }else{
            
            self.nameView.imageView!.transform = CGAffineTransformMakeRotation(0);

        }
    }
}
