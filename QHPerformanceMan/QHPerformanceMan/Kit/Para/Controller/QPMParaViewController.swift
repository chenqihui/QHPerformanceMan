//
//  QPMParaViewController.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/9.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMParaViewController: QPMUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createTopBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Action
    
    @IBAction func goAction(_ sender: Any) {
        let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        let viewController = QPMParaSubViewController(nibName: "QPMParaSubViewController", bundle: bundle)
        viewController.title = "subVC"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
