//
//  ViewController.swift
//  Swift_QQ好友列表
//
//  Created by iOS_DevZhangYu on 15/7/31.
//  Copyright © 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZYHeaderViewDelegate {

    let ID = "cellID"

    var groups:NSMutableArray = {
        
        var tempArray: NSArray = NSArray (contentsOfFile: NSBundle .mainBundle().pathForResource("friends.plist", ofType: nil)! )!
        
        var gourpArray = NSMutableArray()
        
        for dictionary in tempArray{
            
            let friendGroup: FriendGroup = FriendGroup(dictionary: dictionary as! NSDictionary)
            gourpArray .addObject(friendGroup)
        }
        
        return gourpArray
        
    }()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBOutlet weak var zyTableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let group: FriendGroup = groups[section] as! FriendGroup
        
        return group.isOpend ? group.friends.count : 0
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return groups.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = FriendCell .cellWithTableView(tableView)
        
        let group = groups[indexPath.section]
        
        let array = group.friends as NSArray
        
        let item = array[indexPath.row] as! NSDictionary
        
        let obj = Frined(dictionary: item)
        

        cell.friendData = obj
        
        return cell
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let header:ZYHeaderView = ZYHeaderView .headerViewWithTableView(tableView)
        
        header.delegate = self
        
        header.group = groups[section] as? FriendGroup 
        
        return header
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        zyTableView.rowHeight = 50
        zyTableView.sectionHeaderHeight = 44
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func headerViewDidClickedNameView(headerView: ZYHeaderView) {
        
        
        zyTableView .reloadData()
    }
 

}

