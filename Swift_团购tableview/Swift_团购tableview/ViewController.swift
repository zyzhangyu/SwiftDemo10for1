//
//  ViewController.swift
//  Swift_团购tableview
//
//  Created by iOS_DevZhangYu on 15/6/19.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, ZYTgFootViewDelegate {

    lazy var tgs: NSMutableArray = ZYTgModal .tgs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = 80
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        let array: NSArray = NSBundle .mainBundle() .loadNibNamed("ZYTgHeader", owner: nil, options: nil)

        
        
        self.tableView.tableHeaderView = array.lastObject as? UIView
        
        
        let footView = ZYTgFooterView .footView()
        footView.delegate = self
        self.tableView.tableFooterView = footView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return tgs.count
    }
    
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        var zyTableViewCell: ZYTgCell = ZYTgCell .cellWithTableView(tableView: tableView)
        
        print(tgs[indexPath.row])
        
 
        zyTableViewCell.tg = tgs[indexPath.row] as! ZYTgModal
        return zyTableViewCell;
    }

    
    func tgFooterViewDidDownloadButtonClick(footview : ZYTgFooterView) -> () {
    
        println("努力加载数据中...")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            let dictionary: [String : String] = ["title":"哈哈","icon": "ad_00", "price": "100.2", "buyCount": "250"]
            let tg: ZYTgModal = ZYTgModal .tgWithDict(dictionary)
            self.tgs .addObject(tg)
            
            let path: NSIndexPath = NSIndexPath (forRow: self.tgs.count - 1 , inSection: 0)
            
            self.tableView .insertRowsAtIndexPaths([path], withRowAnimation: UITableViewRowAnimation.Middle)
            
            footview .endRefresh()
        }
        
    }

}

