//
//  ViewController.swift
//  Swift_汽车品牌
//
//  Created by iOS_DevZhangYu on 15/6/10.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carGroups: NSArray = ZYCarGroup .carGroups()
    
    
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let group: ZYCarGroup = carGroups[section] as! ZYCarGroup
        
        return group.cars.count
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return carGroups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier: String = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell
        if(cell == nil){
        
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        let group: ZYCarGroup = carGroups[indexPath.section] as! ZYCarGroup
        let car: ZYCar = group.cars[indexPath.row] as! ZYCar
        cell?.imageView?.image = UIImage (named: car.icon)
        cell?.textLabel?.text = car.name
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group: ZYCarGroup = carGroups[section] as! ZYCarGroup
        return group.title
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        let array: NSArray = carGroups .valueForKeyPath("cars.name") as! NSArray
        println("%@",array)
        
        return carGroups .valueForKeyPath("title")  as! [AnyObject]
    }

}

