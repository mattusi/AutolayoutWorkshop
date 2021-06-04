//
//  UIView+Extensions.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 04/06/21.
//

import UIKit

extension UIView {
    /**
     Creates constraints on the 4 sides of the UIView in relation to the passed View.
     
     - Parameters:
     - constraintsRef: The second item of the constraints
     - topDistance: The distance between the two **top** anchors
     - bottomDistance: The distance between the two **bottom** anchors
     - leadingDistance: The distance between the two **leading** anchors or **left** anchors
     - trailingDistance: The distance between the two **trailing** anchors or **right** anchors
     
     */
    
    public func createConstraints<T: UIView>(constraintsRef: T, topDistance: CGFloat? = 0, bottomDistance: CGFloat = 0, leadingDistance: CGFloat = 0, trailingDistance: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let topDistance = topDistance {
            self.topAnchor.constraint(equalTo: constraintsRef.topAnchor, constant: topDistance).isActive = true
        }
        self.bottomAnchor.constraint(equalTo: constraintsRef.bottomAnchor, constant: bottomDistance).isActive = true
        self.leadingAnchor.constraint(equalTo: constraintsRef.leadingAnchor, constant: leadingDistance).isActive = true
        self.trailingAnchor.constraint(equalTo: constraintsRef.trailingAnchor, constant: trailingDistance).isActive = true
    }
    
}
