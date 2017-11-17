//
//  QPMSandboxPlugin.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/10.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMSandboxPlugin: QPMPlugin, QPMPluginProtocol {
    
    override func pluginName() -> String {
        return "沙盒"
    }
    
    override func pluginView() -> UIViewController? {
        let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        let viewController = QPMSandboxBoard(nibName: "QPMSandboxBoard", bundle: bundle)
        return viewController
    }

}
