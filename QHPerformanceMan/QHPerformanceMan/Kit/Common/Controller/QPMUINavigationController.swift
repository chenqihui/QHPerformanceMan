//
//  QPMUINavigationController.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/7.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open var shouldAutorotate: Bool {
//        if let b = viewControllers.last?.shouldAutorotate {
//            return b
//        }
//        return true
        
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (viewControllers.last?.supportedInterfaceOrientations)!
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return (viewControllers.last?.preferredInterfaceOrientationForPresentation)!
    }
    
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }

}
