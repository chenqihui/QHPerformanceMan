//
//  QPMLogoWindow.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/2.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit

protocol QPMLogoDelegate: NSObjectProtocol {
    func handlePanOffset(_ offset: CGPoint, state: UIGestureRecognizerState)
    func onIconDetailWindow()
    func onIconACWindow()
    func didRotate(isPortrait: Bool)
}

class QPMLogoWindow: UIWindow, UIGestureRecognizerDelegate {
    
    let QPM_LOGO_WIDTH = 50
    
    var vc: QPMRotateBoard?
    var iconButton: UIButton = UIButton(type: UIButtonType.custom)
    
    var startPoint: CGPoint?
    
    weak var consoleDelegate: QPMLogoDelegate?
    
    deinit {
        vc?.delegate = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLogoUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private
    
    func layoutLogoFrame(_ orientation: UIInterfaceOrientation) {
        let screenBound = UIScreen.main.bounds
        
        var frame = CGRect(x: 0, y: 0, width: QPM_LOGO_WIDTH, height: QPM_LOGO_WIDTH)
        
        if orientation == .portrait {
            frame.origin.x = screenBound.size.width - frame.size.width
            frame.origin.y = screenBound.size.height - frame.size.height
        }
        else {
            
        }
        
        self.frame = frame
    }
    
    func initLogoUI() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = 0
        layer.masksToBounds = true
        backgroundColor = UIColor.clear
        
        isHidden = false
        windowLevel = UIWindowLevelStatusBar + 199
        
        
        vc = QPMRotateBoard()
        self.rootViewController = vc!
        
        vc!.delegate = self
        vc!.view.frame = self.bounds
        vc!.view.backgroundColor = UIColor.clear
        layoutLogoFrame(vc!.interfaceOrientation)
        
        iconButton.frame = bounds
        iconButton.backgroundColor = UIColor.orange
        iconButton.adjustsImageWhenHighlighted = true
        
        iconButton.addTarget(self, action: #selector(self.onDetailedWindow(_:)), for: .touchUpInside)
        vc!.view.addSubview(iconButton)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        recognizer.delegate = self
        recognizer.maximumNumberOfTouches = 1
        iconButton.addGestureRecognizer(recognizer)
        
//        let logPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressGesture(_:)))
//        logPressGesture.delegate = self
//        logPressGesture.minimumPressDuration = 0.5
//        iconButton.addGestureRecognizer(logPressGesture)
        
    }

    //MARK: Action
    
    @objc func onDetailedWindow(_ sender: UIButton) {
        consoleDelegate?.onIconDetailWindow()
    }
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            let pt = recognizer.location(in: self)
            startPoint = pt
        }
        else if recognizer.state == .changed || recognizer.state == .ended {
            let pt = recognizer.location(in: self)
            var frame = self.frame
            frame.origin.x += pt.x - (startPoint?.x)!
            frame.origin.y += pt.y - (startPoint?.y)!
            
            let offset = CGPoint(x: pt.x - (startPoint?.x)!, y: pt.y - (startPoint?.y)!)
            consoleDelegate?.handlePanOffset(offset, state: recognizer.state)
        }
    }
    
    @objc func handleLongPressGesture(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began: do {
            isUserInteractionEnabled = false
            consoleDelegate?.onIconACWindow()
            break
        }
        case .ended: do {
            isUserInteractionEnabled = true
            break
        }
        case .changed: do {
            isUserInteractionEnabled = true
            break
        }
        default: break
        }
    }
    
}
