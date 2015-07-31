//
//  ViewController.swift
//  Swift_tableView基础
//
//  Created by iOS_DevZhangYu on 15/6/8.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBOutlet weak var aTableView: UITableView!
    
    lazy var dataList: NSArray = {
    

        var zyFriut1: ZYFruit = ZYFruit()
        zyFriut1.name = "第一筐水果"
        zyFriut1.desc = "多汁"
            var list: NSMutableArray = NSMutableArray ()
            for var index: Int = 0; index < 10 ; ++index{
                list .addObject("\(zyFriut1.name) - " + "\(index)")
            }
        zyFriut1.fruit = list
        
        
        var zyFriut2: ZYFruit = ZYFruit()
        zyFriut2.name = "第二筐水果"
        zyFriut2.desc = "好吃"
            var list2: NSMutableArray = NSMutableArray ()
            for var index: Int = 0; index < 20 ; ++index{
                list2 .addObject("\(zyFriut2.name) - " + "\(index)")
            }
        zyFriut2.fruit = list2
        
        var tempList: NSArray = [zyFriut1, zyFriut2]
        return tempList;
     }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataList[section].fruit.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell (style: .Default, reuseIdentifier: nil)
        
        let zyFruit: ZYFruit = dataList[indexPath.section] as! ZYFruit
        
        cell.textLabel?.text = zyFruit.fruit[indexPath.row] as? String
        
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataList[section].name
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataList[section].desc
    }
    
}

