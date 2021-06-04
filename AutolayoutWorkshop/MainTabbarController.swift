//
//  MainTabbarController.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 04/06/21.
//

import UIKit

class MainTabbarController: MyTabbarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .purple
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .cyan
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        self.setViewControllers([vc1,vc2,vc3], animated: false)
    }
    
}
