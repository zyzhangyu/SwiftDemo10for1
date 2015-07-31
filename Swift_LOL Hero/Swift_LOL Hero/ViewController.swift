//
//  ViewController.swift
//  Swift_LOL Hero
//
//  Created by iOS_DevZhangYu on 15/6/9.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var zyTableView: UITableView = {
        
        var tempTableView: UITableView = UITableView (frame: self.view.bounds, style: .Plain)
        tempTableView.dataSource = self
        tempTableView.delegate = self
        return tempTableView;
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view .addSubview(zyTableView)
        self.zyTableView.rowHeight = 120
        self.zyTableView.separatorStyle = .SingleLine
        self.zyTableView.separatorColor = .redColor()
        self.zyTableView.tableHeaderView = {
            let view: UIView = UIView (frame: CGRectMake(0, 0, 320, 44))
            view.backgroundColor = .yellowColor()
            return view
        }()
        self.zyTableView.tableFooterView = {
            let view: UIView = UIView (frame: CGRectMake(0, 0, 320, 33))
            view.backgroundColor = .blackColor()
            return view
        }()
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    var heros: NSArray = ZYHero .heros()

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier: String = "Cell"
        
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let row = indexPath.row
        let hero: ZYHero = ZYHero (zyDictionary: heros[row] as! NSDictionary)
        cell!.textLabel?.text = hero.name
        cell!.detailTextLabel?.text = hero.intro
        cell!.imageView?.image = UIImage (named: hero.icon)
        return cell!
     }

}

