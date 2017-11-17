//
//  QPMPluginViewController.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/9.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMPluginCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class QPMPluginViewController: QPMUIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainTableV: UITableView!
    
    let cellIdentifier = "QPMPluginCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private
    
    override func initUI() {
        super.initUI()
//        let all = Bundle.allFrameworks
//        let path = Bundle.main.path(forResource: "QHPerformanceMan.framework", ofType: nil)
//        var p = NSString(string: path!)
//        p = p.deletingLastPathComponent as NSString
//        p = p.appendingPathComponent("Frameworks/QHPerformanceMan.framework") as NSString
//        let a = Bundle.init(path: p as String)
//        let nib = UINib(nibName: "QHPerformanceMan.framework/QPMPluginCell", bundle: a)
//        mainTableV.register(UINib(nibName: "QPMPluginCell", bundle: a), forCellReuseIdentifier: cellIdentifier)
        
//        let appName = "QHPerformanceMan"
//        let anyClass: AnyClass = NSClassFromString("\(appName).QPMPluginCell")!
//        mainTableV.register(anyClass, forCellReuseIdentifier: cellIdentifier)
        
        let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        let nib = UINib(nibName: "QPMPluginCell", bundle: bundle)
        mainTableV.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QPMPluginList.sharedInstance.dic.keys.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let key = QPMPluginList.sharedInstance.array[indexPath.row]
        if let data = QPMPluginList.sharedInstance.dic[key] {
            cell.textLabel?.text = data.pluginName()
        }
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
//        if cell == nil {
//            cell = QPMPluginCell(style: .subtitle, reuseIdentifier: cellIdentifier)
//        }
//        let key = QPMPluginList.sharedInstance.array[indexPath.row]
//        if let data = QPMPluginList.sharedInstance.dic[key] {
//            cell?.textLabel?.text = data.pluginName()
//        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let key = QPMPluginList.sharedInstance.array[indexPath.row]
        if let data = QPMPluginList.sharedInstance.dic[key] {
            if let vc = data.pluginView() {
                vc.title = data.pluginName()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }

}
