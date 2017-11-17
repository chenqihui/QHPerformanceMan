//
//  QPMUIManager.swift
//  QHPerformanceDemo
//
//  Created by Anakin chen on 2017/11/2.
//  Copyright © 2017年 Anakin Network Technology. All rights reserved.
//

import UIKit
import CoreGraphics

class QPMUIManager: NSObject, QPMLogoDelegate, QPMDetailedDelegate {
    
    static let sharedInstance = QPMUIManager()
    
    let QPM_EDAGE_HEIGHT = 44 as CGFloat
    let QPM_LOGO_WIDTH  = 50 as CGFloat
    
    var logoWindow: QPMLogoWindow?
    var detailedWindow: QPMDetailedWindow?
    
    override init() {
        super.init()
        
        let screenBound = UIScreen.main.bounds
        let shortcutFrame = CGRect(x: screenBound.size.width - QPM_LOGO_WIDTH, y: screenBound.size.height - QPM_LOGO_WIDTH - QPM_LOGO_WIDTH, width: QPM_LOGO_WIDTH, height: QPM_LOGO_WIDTH)
        logoWindow = QPMLogoWindow(frame: shortcutFrame)
        logoWindow!.consoleDelegate = self
    }
    
    //MARK: Private
    
    func layoutFrame() {
        layoutLogoFrame()
    }
    
    func p_onIconACWindow() {
        layoutFrame()
    }
    
    func setGTHidden(hidden: Bool) {
        logoWindow?.isHidden = hidden
    }
    
    func layoutLogoFrame() {
        if var frame = logoWindow?.frame {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationCurve(.easeInOut)
            UIView.setAnimationDelay(0)
            UIView.setAnimationDelegate(self)
            
            if frame.origin.y < QPM_EDAGE_HEIGHT {
                frame.origin.y = QPM_EDAGE_HEIGHT
            }
            
            if frame.origin.y > UIScreen.main.bounds.size.height - QPM_LOGO_WIDTH - QPM_EDAGE_HEIGHT {
                frame.origin.y = UIScreen.main.bounds.size.height - QPM_LOGO_WIDTH - QPM_EDAGE_HEIGHT
            }
            
            if frame.origin.x < (UIScreen.main.bounds.size.width - QPM_LOGO_WIDTH)/2 {
                frame.origin.x = 0
            }
            else {
                frame.origin.x = UIScreen.main.bounds.size.width - QPM_LOGO_WIDTH
            }
            
            logoWindow?.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: QPM_LOGO_WIDTH, height: QPM_LOGO_WIDTH)
            
            UIView.commitAnimations()
        }
        
    }
    
    //MARK: Public
    
    func func_showGTAC() {
        p_onIconACWindow()
    }
    
    func func_hideGTAC() {
        
    }
    
    //MARK: QPMLogoDelegate
    
    func handlePanOffset(_ offset: CGPoint, state: UIGestureRecognizerState) {
        let frame = logoWindow!.frame.offsetBy(dx: offset.x, dy: offset.y)
        logoWindow!.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: logoWindow!.frame.size.width, height: logoWindow!.frame.size.height)
        
        if state == .ended {
            layoutFrame()
        }
    }
    
    func onIconDetailWindow() {
        QPMConfig.sharedInstance.appStatusBarHidden = UIApplication.shared.isStatusBarHidden
        QPMConfig.sharedInstance.appKeyWindow = UIApplication.shared.keyWindow
        
        logoWindow?.isHidden = true
        
        if detailedWindow == nil {
            detailedWindow = QPMDetailedWindow(frame: UIScreen.main.bounds, boardIndex: 1, delegate: self)
        }
        detailedWindow?.isHidden = false
        detailedWindow?.makeKeyAndVisible()
    }
    
    func onIconACWindow() {
        p_onIconACWindow()
    }
    
    func didRotate(isPortrait: Bool) {
    }
    
    //MARK: QPMDetailedDelegate
    
    func onCloseWindow() {
        UIApplication.shared.isStatusBarHidden = QPMConfig.sharedInstance.appStatusBarHidden
        QPMConfig.sharedInstance.appKeyWindow?.makeKeyAndVisible()
        QPMConfig.sharedInstance.appKeyWindow = nil
        
        detailedWindow?.isHidden = true
        
        logoWindow?.isHidden = false
    }
}
