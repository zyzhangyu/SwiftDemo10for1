//
//  ZYTgCell.swift
//  Swift_团购tableview
//
//  Created by iOS_DevZhangYu on 15/6/19.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYTgCell: UITableViewCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
      var tg: ZYTgModal {
        
        get{
            return tg;
        }
        
        set{            
            titleLabel.text = newValue.title
            iconImgv.image = UIImage (named: newValue.icon)
            priceLabel.text = newValue.price
            buyCountLabel.text = newValue.buyCount
        }
    }
    
    
    @IBOutlet weak var iconImgv: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyCountLabel: UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    
    
    
    
    
    class func cellWithTableView(#tableView: UITableView) -> ZYTgCell{
        
        let id = "zyCell"
        
        var cell: ZYTgCell? = tableView .dequeueReusableCellWithIdentifier(id) as? ZYTgCell
        
        if(cell == nil){
            
            let array: NSArray = NSBundle .mainBundle() .loadNibNamed("ZYTgCell", owner: nil, options: nil)
            cell =  array.lastObject as? ZYTgCell
        }
        return cell!
    }
    
    
    
    
}
