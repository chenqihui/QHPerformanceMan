//
//  QPMPluginList.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/9.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMPluginList: NSObject {
    
    static let sharedInstance = QPMPluginList()
    
    var dic = Dictionary<String, QPMPlugin>()
    
    func addPlugin(obj: QPMPlugin) {
        dic.updateValue(obj, forKey: obj.pluginName())
    }
    
    var array: Array<String> {
        return Array(dic.keys)
    }

}
