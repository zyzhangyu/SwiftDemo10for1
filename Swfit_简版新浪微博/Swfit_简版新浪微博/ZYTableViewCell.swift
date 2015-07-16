//
//  ZYTableViewCell.swift
//  Swfit_简版新浪微博
//
//  Created by iOS_DevZhangYu on 15/7/16.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYTableViewCell: UITableViewCell {

    
    var statusFrame: StatusFrame = StatusFrame(){
        
        didSet{
            
            
            self .settingData()
            
            self .settingFrame()
            
            self.contentView .addSubview(iconView)
            self.contentView .addSubview(nameLabel)
            self.contentView .addSubview(vipView)
            self.contentView .addSubview(textView)
            self.contentView .addSubview(pictureView)
        }
    }
    
    
    func settingData() -> () {
    
        let status: ZYStatus = statusFrame.status!
        
        iconView.image = UIImage (named: status.icon)
        nameLabel.text = status.name
        if(status.vip == true){
            
            vipView.hidden = false
            nameLabel.textColor = UIColor .redColor()
        } else {
        
            vipView.hidden = true
            nameLabel.textColor = UIColor .blackColor()
        }
        
        textView.text = status.text
        let string :NSString? = status.picture
        
        
        if string != nil{
        
            if(string!.length > 0){
            
                pictureView.hidden = false
                pictureView.image = UIImage (named: string! as String)

            } else {
            
                pictureView.hidden = true
            }
        }
    }
    
    func settingFrame() -> (){
    
        iconView.frame = statusFrame.iconF
        
        nameLabel.frame = statusFrame.nameF
        
        vipView.frame = statusFrame.vipF
        
        textView.frame = statusFrame.textF
        
        if(statusFrame.status?.picture != nil){
            
            if(statusFrame.status!.picture!.length > 0){
                pictureView.frame = statusFrame.pictureF

            }else{
            }
            
        }else{
            pictureView.frame = CGRectZero

        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var iconView: UIImageView = {
    
        var imgView: UIImageView = UIImageView ()
        return imgView
    }()
    
    lazy var nameLabel: UILabel = {
        
        var label: UILabel = UILabel ()
        label.font = UIFont .systemFontOfSize(14)
        return label
    }()
    
    lazy var vipView: UIImageView = {
        
        var imageView: UIImageView = UIImageView ()
        imageView.image = UIImage (named: "vip")
        imageView.hidden = true
        return imageView
    }()
    
    lazy var textView: UILabel = {
        
        var label: UILabel = UILabel ()
        label.font = UIFont .systemFontOfSize(16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var pictureView: UIImageView = {
        
        var imgView: UIImageView = UIImageView ()
        return imgView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    

}
