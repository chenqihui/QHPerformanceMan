//
//  ViewController.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/1.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit
import QHPerformanceMan

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        QPMDebugConsole.func_setGTHidden(hidden: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

