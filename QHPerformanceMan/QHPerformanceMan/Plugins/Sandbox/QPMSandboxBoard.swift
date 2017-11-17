//
//  QPMSandboxBoard.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/14.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

class QPMToolSandboxCell: UITableViewCell {
    
    var isDirectory = false
    var filePath = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bindData(_ data: Any) {
        filePath = data as! String
        if filePath == ".." {
            textLabel?.text = filePath
        }
        else {
            if let attributes = try? FileManager.default.attributesOfItem(atPath: filePath) as NSDictionary {
                if attributes.fileType() == FileAttributeType.typeDirectory.rawValue {
                    isDirectory = true
                }
            }
            
            let path = NSString(string: filePath)
            textLabel?.text = path.lastPathComponent
            detailTextLabel?.text = ""
            
            if isDirectory == false {
                if let attributes = try? FileManager.default.attributesOfItem(atPath: filePath) as NSDictionary {
                    let size = attributes[FileAttributeKey.size]
                    detailTextLabel?.text = "\(String(describing: size))"
                }
            }
        }
    }
}

class QPMSandboxBoard: QPMUIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainTableV: UITableView!
    
    let cellIdentifier = "QPMToolSandboxCell"
    
    var filePath = NSString(string: NSHomeDirectory())
    
    var fileArray: Array<String> = []
    
    var folderDepth = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = filePath.lastPathComponent
        
        let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
        let nib = UINib(nibName: "QPMToolSandboxCell", bundle: bundle)
        mainTableV.register(nib, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if fileArray.count == 0 {
            fileArray.append("..")
            if let array = try? FileManager.default.contentsOfDirectory(atPath: filePath as String) {
                for value in array {
                    fileArray.append(value)
                }
            }
        }
    }
    
    //MARK: Private
    
    //MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! QPMToolSandboxCell
        
        let file = fileArray[indexPath.row]
        
        if file == ".." {
            cell.bindData(file)
        }
        else {
            let path = "\(filePath)/\(file)"
            cell.bindData(path)
        }
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let file = fileArray[indexPath.row]
        
        if file == ".." {
            navigationController?.popViewController(animated: true)
            return
        }
        
        let cell = tableView.cellForRow(at: indexPath) as! QPMToolSandboxCell
        if cell.isDirectory == true {
            let bundle = Bundle(identifier: "com.chen.QHPerformanceMan")
            let viewController = QPMSandboxBoard(nibName: "QPMSandboxBoard", bundle: bundle)
            viewController.folderDepth = folderDepth + 1
            viewController.filePath = cell.filePath as NSString
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
