//
//  QPMConfig.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/6.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMConfig: NSObject {
    static let sharedInstance = QPMConfig()
    
    var appStatusBarHidden: Bool = false
    var appStatusBarOrientation: UIInterfaceOrientation?
    var appKeyWindow: UIWindow?
    
    var showAC: Bool = false
}
