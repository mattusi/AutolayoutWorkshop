//
//  MyTabbarViewController.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 04/06/21.
//

import UIKit

open class MyTabbarViewController: UITabBarController {
    
    //MARK: - Variables
    private var myTabbar = TabbarView()
    
    required public init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        customInit()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        customInit()
    }
    
    private func customInit() {
        //Give the tabbar a nice background
        myTabbar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        myTabbar.layer.shadowOpacity = 1
        myTabbar.layer.shadowOffset = CGSize(width: 0, height: 8)
        myTabbar.layer.shadowRadius = 15
        tabBar.isHidden = true
        
        attachTabbar()
        
    }
    
    private func attachTabbar() {
        self.view.addSubview(myTabbar)
        
        myTabbar.isUserInteractionEnabled = true
        myTabbar.setDelegate(to: self)
        
        myTabbar.frame = CGRect(x: self.view.frame.width / 2, y: self.view.frame.height, width: 0, height: 0)
        
        DispatchQueue.main.async {
            self.myTabbar.createConstraints(constraintsRef: self.view, topDistance: nil, bottomDistance: -24, leadingDistance: 16, trailingDistance: -16)
            self.myTabbar.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -88).isActive = true
            
            UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
}


extension MyTabbarViewController: TabbarDelegate {
    public func didSelectItemAtIndex(item: TabBarItem) {
        guard let viewControllers = self.viewControllers else { return }
        
        if let selectedVC = viewControllers[safe: item.rawValue] {
            self.selectedViewController = selectedVC
        }
    }
}
