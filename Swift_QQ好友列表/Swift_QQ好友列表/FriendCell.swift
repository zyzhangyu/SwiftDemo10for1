//
//  FriendCell.swift
//  Swift_QQ好友列表
//
//  Created by iOS_DevZhangYu on 15/7/31.
//  Copyright © 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {


    var friendData:Frined! = nil{
        
        didSet{
            
            imageView!.image = UIImage(named: (friendData?.icon)!)
            textLabel!.text = friendData?.name
            (textLabel!.textColor = friendData!.vip ? UIColor.redColor() : UIColor.blackColor() )
            detailTextLabel?.text = friendData!.intro
            
        }
    };
    
    
    class func cellWithTableView(tableView: UITableView) -> (FriendCell){
    
        let thisID = "friend"
        
        var cell: FriendCell? = tableView .dequeueReusableCellWithIdentifier(thisID) as! FriendCell?
        
        if(cell == nil ){
            
            cell = FriendCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: thisID)
        }
        
        
        return cell!
    }
    
    
}
