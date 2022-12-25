//
//  CustomUiTabBar.swift
//  salam
//
//  Created by user229516 on 11/8/22.
//

import UIKit

class CustomUiTabBar: UITabBar {

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        
        var sizeThatFits = super.sizeThatFits(size)
        
        sizeThatFits.height = sizeThatFits.height + 100
        
        return sizeThatFits
    }

}
