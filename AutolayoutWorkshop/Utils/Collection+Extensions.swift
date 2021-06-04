//
//  Collection+Extensions.swift
//  AutolayoutWorkshop
//
//  Created by Matheus Tusi on 04/06/21.
//

import Foundation

extension Collection {
    
    /// Returns the elemente at the specified index if it is within bounds, otherwise nil
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
