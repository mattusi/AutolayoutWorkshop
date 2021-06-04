//
//  TabbarView.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 21/05/21.
//

import UIKit

public enum TabBarItem: Int {
    case home = 0
    case buy = 1
    case scan = 2
    case profile = 3
    case others = 4
    case none = 5
}

public protocol TabbarDelegate {
    func didSelectItemAtIndex(item: TabBarItem)
}


class TabbarView: UIView {
    
    
    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var rectangleView: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak private var homeIndicatorConstraint: NSLayoutConstraint!
    @IBOutlet weak private var buyIndicatorContraint: NSLayoutConstraint!
    @IBOutlet weak private var scanIndicatorConstraint: NSLayoutConstraint!
    @IBOutlet weak private var profileIndicatorConstraint: NSLayoutConstraint!
    @IBOutlet weak private var othersIndicatorConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    private var delegate: TabbarDelegate!
    private var currentItem: TabBarItem = .home
    private var systemButtonsImages: [String] = ["house.fill", "cart.fill", "barcode.viewfinder", "person.fill", "gear"]
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        guard let view = Bundle.main.loadNibNamed("TabbarView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        
        rectangleView.clipsToBounds = true
        rectangleView.layer.cornerRadius = 33
        
        setButtonImages()
        setButtonTargets()
        changeSelecteditemColor()
        
    }
    
    func setDelegate(to delegate: TabbarDelegate) {
        self.delegate = delegate
    }
    
    func sendViaDelegate(item: TabBarItem) {
        delegate.didSelectItemAtIndex(item: item)
    }
    
    private func setButtonImages() {
        for (index, buttom) in buttons.enumerated() {
            if let image = UIImage(systemName: systemButtonsImages[index])?.withRenderingMode(.alwaysTemplate) {
                buttom.setImage(image, for: .normal)
                buttom.setTitle("", for: .normal)
                buttom.imageView!.tintColor = .gray
            }
        }
    }
    
    private func setButtonTargets() {
        for buttom in buttons {
            buttom.addTarget(self, action: #selector(buttonTarget(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func buttonTarget(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            changeSelectedItem(to: .home)
        case 1:
            changeSelectedItem(to: .buy)
        case 2:
            changeSelectedItem(to: .scan)
        case 3:
            changeSelectedItem(to: .profile)
        case 4:
            changeSelectedItem(to: .others)
        default:
            break
        }
    }
    
    private func changeSelectedItem(to newSelection: TabBarItem) {
        if newSelection != currentItem {
            animateRectangle(to: newSelection, from: currentItem)
            delegate.didSelectItemAtIndex(item: newSelection)
            currentItem = newSelection
            changeSelecteditemColor()
        }
    }
    
    
    private func changeSelecteditemColor() {
        for (index, buttom) in buttons.enumerated() {
            if index == currentItem.rawValue {
                buttom.imageView?.tintColor = .blue
            } else {
                buttom.imageView?.tintColor = .gray
            }
        }
    }
    
    private func animateRectangle(to inicatorDestination: TabBarItem, from indicatorOrigin: TabBarItem) {
        self.indicatorView.alpha = 1
        switch inicatorDestination {
        case .home:
            print("Move indicator Home")
            homeIndicatorConstraint.priority = .defaultHigh
            buyIndicatorContraint.priority = .defaultLow
            scanIndicatorConstraint.priority = .defaultLow
            profileIndicatorConstraint.priority = .defaultLow
            othersIndicatorConstraint.priority = .defaultLow
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            })
        case .buy:
            print("Move indicator buy")
            homeIndicatorConstraint.priority = .defaultLow
            buyIndicatorContraint.priority = .defaultHigh
            scanIndicatorConstraint.priority = .defaultLow
            profileIndicatorConstraint.priority = .defaultLow
            othersIndicatorConstraint.priority = .defaultLow
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            })
        case.scan:
            print("Move indicator scan")
            homeIndicatorConstraint.priority = .defaultLow
            buyIndicatorContraint.priority = .defaultLow
            scanIndicatorConstraint.priority = .defaultHigh
            profileIndicatorConstraint.priority = .defaultLow
            othersIndicatorConstraint.priority = .defaultLow
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            })
        case .profile:
            print("Move indicator profile")
            homeIndicatorConstraint.priority = .defaultLow
            buyIndicatorContraint.priority = .defaultLow
            scanIndicatorConstraint.priority = .defaultLow
            profileIndicatorConstraint.priority = .defaultHigh
            othersIndicatorConstraint.priority = .defaultLow
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            })
        case .others:
            print("Move indicator others")
            homeIndicatorConstraint.priority = .defaultLow
            buyIndicatorContraint.priority = .defaultLow
            scanIndicatorConstraint.priority = .defaultLow
            profileIndicatorConstraint.priority = .defaultLow
            othersIndicatorConstraint.priority = .defaultHigh
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            })
        case .none:
            print("Remove indicatior")
            homeIndicatorConstraint.priority = .defaultLow
            buyIndicatorContraint.priority = .defaultLow
            scanIndicatorConstraint.priority = .defaultLow
            profileIndicatorConstraint.priority = .defaultLow
            othersIndicatorConstraint.priority = .defaultHigh
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.layoutIfNeeded()
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.indicatorView.alpha = 0.0
                })
            })
            
        }
        
    }
}
