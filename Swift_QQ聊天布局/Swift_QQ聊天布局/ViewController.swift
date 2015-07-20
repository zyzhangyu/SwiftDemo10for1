//
//  ViewController.swift
//  Swift_QQ聊天布局
//
//  Created by iOS_DevZhangYu on 15/7/17.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zyTableView: UITableView!
    
    @IBOutlet weak var toolsView: UIView!
    
    let autoReplays: NSDictionary = {
        
        let string: String = NSBundle .mainBundle() .pathForResource("autoReplay.plist", ofType: nil)!
        let dictionary: NSDictionary = NSDictionary (contentsOfFile: string)!
        
        return dictionary;
        
    }()
    
    let ID = "Cell"

    
    var messageFrames: NSMutableArray = {
        
        let array: NSArray = NSArray (contentsOfFile: NSBundle .mainBundle() .pathForResource("messages.plist", ofType: nil)! )!
        
        var arrayM: NSMutableArray = NSMutableArray()
        
        
        var dictionary: NSDictionary = NSDictionary()
        
        for  dictionary in array{
            
            var message: ZYMessage = ZYMessage (dictionary: dictionary as! NSDictionary)
            
            let lastFm: ZYMessageFrame? = arrayM.lastObject as? ZYMessageFrame
            
            let string: NSString = message.time
            
            if (lastFm == nil){
                message.hideTime = false
            }else{
                message.hideTime = (lastFm!.message!.time).isEqualToString(string as String)
            }
            
            let messageFrame: ZYMessageFrame = ZYMessageFrame()
            messageFrame.message = message
            
            arrayM .addObject(messageFrame)
        }
        
        return arrayM
    }()
    
    @IBOutlet weak var zyTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        zyTableView.separatorStyle = UITableViewCellSeparatorStyle.None //分割线None
        zyTableView.allowsSelection = false// 禁止选中
        zyTableView.backgroundColor = UIColor (red: 225/255.0, green: 225/255/0, blue: 225/255.0, alpha: 1.0)
        
        zyTextField.leftView = UIView (frame: CGRectMake(0, 0, 8, 0))
        zyTextField.leftViewMode = UITextFieldViewMode.Always
        zyTextField.delegate = self
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "keyboardWillChange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    
    
    func keyboardWillChange(noti: NSNotification) ->(){
        
        println("~~~~~~~~~~\(noti)")
        
        self.view.window?.backgroundColor = self.zyTableView.backgroundColor
        
        let userInfo: NSDictionary = noti.userInfo! as NSDictionary
        
        let value: NSValue =  userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        
        let transformY =  value.CGRectValue().origin.y
        
        let timeInterval: NSTimeInterval = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSTimeInterval
 
        UIView .animateWithDuration(timeInterval, animations: { () -> Void in
            self.view.transform = CGAffineTransformMakeTranslation(0 , transformY - screenH)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageFrames.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let messageFrame: ZYMessageFrame = self.messageFrames[indexPath.row] as! ZYMessageFrame
        
        return messageFrame.cellHeight
    }
    
    func numberOfSections() -> Int{
    
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:ZYTalkTableViewCell? = tableView.dequeueReusableCellWithIdentifier(ID) as? ZYTalkTableViewCell
        
        if (cell == nil) {
            cell = ZYTalkTableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: ID)
        }
        
        cell?.messageFrame = messageFrames[indexPath.row] as! ZYMessageFrame
        
        return cell!
    }
    
 
    func addMessage(text: NSString, type:MessageModelType) ->(){
    
        var message = ZYMessage()
        message.text = text
        
        var date: NSDate = NSDate()
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        message.time = dateFormatter .stringFromDate(date)
        message.type = type
        
        var lastMessageFrame = ZYMessageFrame()
        lastMessageFrame.message = message
        
        
        messageFrames .addObject(lastMessageFrame)
    }

    
    func autoPlayMessage() -> NSString{
    
        return "加油"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //1. 添加新的对话到数据模型
        self .addMessage(textField.text, type: MessageModelType.MessageModelGatsby)
        
        //2. 自动回复
        self .addMessage(self.autoPlayMessage(), type: MessageModelType.MessageModelJobs)
        
        //3. 刷新表视图
        zyTableView.reloadData()
        
        //4. 下滑到最后一条
        let indexPath: NSIndexPath = NSIndexPath (forRow: self.messageFrames.count-1, inSection: 0)
        zyTableView .scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
        //5. 清空textfiled
        zyTextField.text = nil
        
        return true
        
    }
}

