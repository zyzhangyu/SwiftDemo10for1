//
//  ZYTalkTableViewCell.swift
//  Swift_QQ聊天布局
//
//  Created by iOS_DevZhangYu on 15/7/17.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ZYTalkTableViewCell: UITableViewCell {
    
    let textPadding: CGFloat = 20


    var timeLabel: UILabel = UILabel()
    var icomImageView: UIImageView = UIImageView ()
    var button: UIButton = UIButton ()
    var messageFrame: ZYMessageFrame = ZYMessageFrame(){
    
        
        didSet{
            var message: ZYMessage = messageFrame.message!
            
            //1. 时间
            timeLabel.frame = messageFrame.timeF
            timeLabel.text = message.time as String
            
            //2. 头像
            switch(message.type){
                
                case .MessageModelGatsby:
                    icomImageView.image = UIImage (named: "Gatsby")
                case .MessageModelJobs:
                    icomImageView.image = UIImage (named: "Jobs")
            }
            icomImageView.frame = messageFrame.iconF
            
            //3. 正文
            button .setTitle(message.text as String, forState: UIControlState.Normal)
            button.frame = messageFrame.textF
            
            
            //4. 正文气泡
            switch(message.type){
                
            case .MessageModelGatsby:
                button .setBackgroundImage(self .resizeImageWithName("chat_send_nor"), forState: UIControlState.Normal)
            case .MessageModelJobs:
                button .setBackgroundImage(self .resizeImageWithName("chat_recive_nor"), forState: UIControlState.Normal)

            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure theb view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        //1. 时间
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.font = UIFont .systemFontOfSize(13.0)
        self.contentView .addSubview(timeLabel)
        
        //2. 头像
        self.contentView .addSubview(icomImageView)
        
        //3. 正文
        button.titleLabel?.font = UIFont .systemFontOfSize(15.0)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor .blackColor(), forState: UIControlState.Normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(textPadding, textPadding, textPadding, textPadding)
        self.contentView .addSubview(button)
        
        self.backgroundColor = UIColor .clearColor()
        
     }
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resizeImageWithName(name: String) -> UIImage{
        
        var image: UIImage = UIImage (named : name)!
        
        let w = image.size.width * 0.5 - 1
        let h = image.size.height * 0.5 - 1
        
        return image .resizableImageWithCapInsets(UIEdgeInsetsMake(h, w, h, w))
        
    }

}



