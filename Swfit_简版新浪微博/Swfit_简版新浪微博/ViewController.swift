//
//  ViewController.swift
//  Swfit_简版新浪微博
//
//  Created by iOS_DevZhangYu on 15/7/15.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let ID = "Cell"
    
    @IBOutlet weak var zyTableView: UITableView!
    
    var statusFrames: NSArray = StatusFrame .statusFrames()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 为tableView注册可重用单元格
//        zyTableView .registerClass(ZYTableViewCell.self , forCellReuseIdentifier: ID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK:
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statusFrames.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var cell:ZYTableViewCell? = tableView .dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath) as? ZYTableViewCell
     
        
        var cell:ZYTableViewCell? = tableView.dequeueReusableCellWithIdentifier(ID) as? ZYTableViewCell
        
        if (cell == nil) {
            cell = ZYTableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: ID)
         }
        cell?.statusFrame = statusFrames[indexPath.row] as! StatusFrame


        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let statusFrame: StatusFrame = statusFrames[indexPath.row] as! StatusFrame
        
        return statusFrame.cellHeight
    }

    
}

