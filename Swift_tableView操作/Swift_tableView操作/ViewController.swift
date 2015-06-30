//
//  ViewController.swift
//  Swift_tableView操作
//
//  Created by iOS_DevZhangYu on 15/6/15.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var dataList: NSMutableArray = ["qqqqq","wwwwwwww","eeeeeee","rrrrrrrrrr","tttttttt","yyyyyyyyyy","uuuuuuuuuuuu","iiiiiiiiiiii","oooooooooooo","ppppppppppp","aaaaaaaaaa","ssssssssss","ddddddddddd","ffffffffff","ggggggggggggg","hhhhhhhhhhhhh"];
    
    lazy var zyTableView: UITableView = {
        
        var tempTableView = UITableView (frame: self.view.bounds, style: UITableViewStyle.Plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view .addSubview(zyTableView)
        
        //开启编辑，yes默认开始删除模式
        zyTableView.editing = true
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataList.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier: String = "Cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        
        if(cell == nil){
            cell = UITableViewCell (style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = self.dataList[indexPath.row] as? String
        return cell!
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            dataList.removeObjectAtIndex(indexPath.row)
            tableView .deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        }else if(editingStyle == UITableViewCellEditingStyle.Insert){
            
            dataList .insertObject("章鱼哥", atIndex: indexPath.row+1)
            let zyIndexPath = NSIndexPath (forRow: indexPath.row+1, inSection: indexPath.section)
            zyTableView .insertRowsAtIndexPaths([zyIndexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if(indexPath.row % 2 == 1){
            return UITableViewCellEditingStyle.Insert
        }
        else{
            return UITableViewCellEditingStyle.Delete
        }
    }
    
//    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        let source: AnyObject  = self.dataList[sourceIndexPath.row]
//        
//        dataList .removeObjectAtIndex(sourceIndexPath.row)
//        
//        dataList .insertObject(source, atIndex: destinationIndexPath.row)
//    }

}

