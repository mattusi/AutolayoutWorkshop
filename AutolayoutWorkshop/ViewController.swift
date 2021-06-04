//
//  ViewController.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 18/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var myTabbarController = MyTabbarViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .purple
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .cyan
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        myTabbarController.setViewControllers([vc1,vc2,vc3], animated: false)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.present(self.myTabbarController, animated: false, completion: nil)
        }
        myTabbarController.modalPresentationStyle = .fullScreen
        
    }
}
