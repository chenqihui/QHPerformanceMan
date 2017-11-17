//
//  QPMPlugin.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/9.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

public protocol QPMPluginProtocol: NSObjectProtocol {
    func pluginIcon() -> UIImage?
    func pluginName() -> String
    func pluginInfo() -> String
    func pluginView() -> UIViewController?
}

class QPMPlugin: NSObject {
    
    func pluginIcon() -> UIImage? {
        return nil
    }
    
    func pluginName() -> String {
        return NSStringFromClass(self.classForCoder)
    }
    
    func pluginInfo() -> String {
        return NSStringFromClass(self.classForCoder)
    }
    
    func pluginView() -> UIViewController? {
        return nil
    }
}
