//
//  QPMDebugConsole.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/6.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

public class QPMDebugConsole: NSObject {
    
    public static let sharedInstance = QPMDebugConsole()
    
    //MARK: Private
    
    func loadDatas() {
        //加载各种监听和插件
        var plugin: QPMPlugin
        plugin = QPMSandboxPlugin()
        QPMPluginList.sharedInstance.addPlugin(obj: plugin)
    }
    
    @objc func initGTUI() {
        QPMUIManager.sharedInstance.func_showGTAC()
    }
    
    //MARK: Public
    
    public class func func_initGT() {
        QPMDebugConsole.sharedInstance.loadDatas()
        QPMDebugConsole.sharedInstance.perform(#selector(QPMDebugConsole.initGTUI), with: nil, afterDelay: 0.5)
    }
    
    public class func func_setGTHidden(hidden: Bool) {
        QPMUIManager.sharedInstance.setGTHidden(hidden: hidden)
    }

}
