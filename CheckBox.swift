//
//  CheckBox
//  CheckBox.swift
//
//  Copyright © 2017 Kenan Atmaca. All rights reserved.
//  kenanatmaca.com
//

import UIKit

enum size {
    case small
    case medium
    case big
}

enum style {
    case rect
    case oval
}

enum effect {
    case none
    case normal
    case scale
}

class CheckBox: NSObject {

    private var window:UIView = UIView()
    private var content:CAShapeLayer!
    private var toView:UIView!
    private var contentPath:UIBezierPath!
    private var tapGesture:UITapGestureRecognizer!
    private var boxStyle:style!
    
    var animation:effect = .normal
    
    var center:CGPoint? {
        get {
            return window.center
        }
     }
    
    var size:CGSize? {
        get {
            return window.frame.size
        }
    }
    
    var windowColor:UIColor? {
        didSet {
            window.backgroundColor = windowColor
        }
    }
    
    var windowBorderColor:UIColor? {
        didSet {
            window.layer.borderColor = windowBorderColor?.cgColor
        }
    }
    
    var windowBorderWidth:CGFloat! {
        didSet {
            window.layer.borderWidth = windowBorderWidth
        }
    }
    
    var contentColor:UIColor?
    var contentBorderColor:UIColor?
    
    var state:Bool = false
    
    private var normalAnimation:CABasicAnimation = {
        
        let nAnim = CABasicAnimation()
        nAnim.keyPath = "opacity"
        nAnim.fromValue = 0
        nAnim.toValue = 1
        nAnim.duration = 1.1
        nAnim.autoreverses = false
        nAnim.fillMode = kCAFillModeForwards
        nAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        return nAnim
        
    }()
    
    private var scaleAnimation:CABasicAnimation = {
        
        let sAnim = CABasicAnimation()
        sAnim.keyPath = "transform.scale"
        sAnim.fromValue = 0
        sAnim.toValue = 1
        sAnim.duration = 0.5
        sAnim.fillMode = kCAFillModeForwards
        sAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        return sAnim
        
    }()
    
    
    init(view:UIView,style:style) {
        
        toView = view
        boxStyle = style
        
    }

    func create(size: size, center:CGPoint) {
        
        window = UIView()
        window.center = center
        window.backgroundColor = UIColor.clear
        window.layer.borderWidth = 2
        window.layer.borderColor = UIColor.lightGray.cgColor
        
        switch (size) {
        case .small:
            window.frame.size = CGSize(width: 32.5, height: 32.5)
        case .medium:
            window.frame.size = CGSize(width: 40, height: 40)
        case .big:
            window.frame.size = CGSize(width: 47.5, height: 47.5)
        }
        
        if case boxStyle = style.rect {
            window.layer.cornerRadius = 3
        } else if case boxStyle = style.oval {
            window.layer.cornerRadius = window.frame.size.width / 2
        }
        
        createContent()
        
        toView.addSubview(window)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkWindow))
        window.addGestureRecognizer(tapGesture)
        
    }
    
    func checkWindow() {
        
        if !state {
            
            switch (animation) {
            case .normal: content.add(normalAnimation, forKey: nil)
            case .scale: content.add(scaleAnimation, forKey: nil)
            default: return
            }
            
            content.fillColor = contentColor?.cgColor ?? UIColor.lightGray.cgColor
            state = true
            
        } else {
            
            switch (animation) {
            case .normal: content.add(normalAnimation, forKey: nil)
            case .scale: content.add(scaleAnimation, forKey: nil)
            default: return
            }
            
            content.fillColor = UIColor.clear.cgColor
            state = false
        }
    }
    
    private func createContent() {

        let cw = size!.width - size!.width * 0.4
        let ch = size!.height - size!.height * 0.4
        
        let contentPathRect:CGRect = CGRect(x: size!.width / 2 - cw/2 , y: size!.height / 2 - ch / 2, width: cw, height: ch)
        
        if case boxStyle = style.rect {
            contentPath = UIBezierPath(roundedRect: contentPathRect, cornerRadius: 3)
        } else if case boxStyle = style.oval {
            contentPath = UIBezierPath(ovalIn: contentPathRect)
        }
        
        contentPath.close()
        
        content = CAShapeLayer()
        content.path = contentPath.cgPath
        content.lineWidth = 1
        content.strokeColor = contentBorderColor?.cgColor ?? UIColor.lightGray.cgColor
        content.fillColor = state == false ? UIColor.clear.cgColor : contentColor?.cgColor ?? UIColor.lightGray.cgColor
        
        window.layer.addSublayer(content)
    }
    
}//
