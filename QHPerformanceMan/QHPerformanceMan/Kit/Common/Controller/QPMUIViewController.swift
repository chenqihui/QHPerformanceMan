//
//  QPMUIViewController.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/7.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private
    
    func leftBarButtonItems() -> [UIBarButtonItem] {
        let barView = UIView(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        let barBtn = UIButton(frame: barView.bounds)
        barBtn.setTitle("<返回", for: .normal)
        barBtn.addTarget(self, action: #selector(self.onBackClicked(_:)), for: .touchUpInside)
        
        barView.addSubview(barBtn)
        
        let bar1 = UIBarButtonItem(customView: barView)
        
        return [bar1]
    }
    
    func initUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    //MARK: Public
    
    func createTopBar() {
        navigationController?.navigationItem.leftBarButtonItems = leftBarButtonItems()
    }
    
    //MARK: Action
    
    @objc func onBackClicked(_ sender: UIButton) {
        
    }

}
