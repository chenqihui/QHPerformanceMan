//
//  QPMDetailedWindow.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/7.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

protocol QPMDetailedDelegate: NSObjectProtocol {
    func onCloseWindow()
}

class QPMDetailedWindow: UIWindow, UINavigationControllerDelegate {
    
    weak var consoleDelegate: QPMDetailedDelegate?
    
    var barController: QPMTabBarController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, boardIndex index: uint, delegate: QPMDetailedDelegate) {
        self.init(frame: frame)
        
        consoleDelegate = delegate
        initUIWithIndex(index: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private
    
    func initBoards() -> [[String: Any]] {
        let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        
        let viewControllerOne = QPMParaViewController(nibName: "QPMParaViewController", bundle: bundle)
        let viewControllerTwo = QPMLogViewController(nibName: "QPMLogViewController", bundle: bundle)
        let viewControllerThree = QPMPluginViewController(nibName: "QPMPluginViewController", bundle: bundle)
        let viewControllerFour = QPMSettingViewController(nibName: "QPMSettingViewController", bundle: bundle)
        
        return [["vc": viewControllerOne, "title": "参数"],
                ["vc": viewControllerTwo, "title": "日志"],
                ["vc": viewControllerThree, "title": "插件"],
                ["vc": viewControllerFour, "title": "设置"]]
    }
    
    func initUIWithIndex(index: uint) {
        
        barController = QPMTabBarController()
        
        let boards = initBoards()
        
        for (i, data) in boards.enumerated() {
            
//            let appName = "QHPerformanceMan"//Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//            let anyClass: AnyClass = NSClassFromString("\(appName).\(data[0])")!
//            let classType = anyClass as? QPMUIViewController.Type
//            let viewController = classType!.init()
//            viewController.hidesBottomBarWhenPushed = true
            
            let viewController = data["vc"] as! QPMUIViewController
            let title = data["title"] as! String
            viewController.tabBarItem = UITabBarItem(title: title, image: nil, tag: i)
            
            viewController.title = title
            addCloseBtnForVC(viewController, action: #selector(self.onCloseWindow(_:)))
            
            let nav = QPMUINavigationController(rootViewController: viewController)
            nav.navigationBar.barStyle = .blackOpaque
            nav.delegate = self
            
            barController?.addChildViewController(nav)
        }
        
        self.rootViewController = barController!
        
        makeKeyAndVisible()
    }
    
    func addCloseBtnForVC(_ viewController: QPMUIViewController, action: Selector) {
        
        let barView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 43))
        let barBtn = UIButton(frame: barView.bounds)
        barBtn.setTitle("关闭", for: .normal)
        barBtn.addTarget(self, action: action, for: .touchUpInside)
        
        barView.addSubview(barBtn)
        
        let barItem = UIBarButtonItem(customView: barView)
        
        viewController.navigationItem.leftBarButtonItem = barItem;
    }
    
    //MARK: UINavigationControllerDelegate
    
    
    //MARK: Action
    
    @objc func onCloseWindow(_ sender: UIButton) {
        consoleDelegate?.onCloseWindow()
    }
    
}
