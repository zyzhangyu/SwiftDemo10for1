//
//  ViewController.swift
//  SwiftDemo10for1
//
//  Created by iOS_DevZhangYu on 15/4/10.
//  Copyright (c) 2015年 iOS_DevZhangYu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goDemo1(sender: UIButton) {

        println("进入demo1")
        
        println("进入demo1")

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("IDENTIFIER") as! OneDemoViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}


