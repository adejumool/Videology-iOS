//
//  Anchor.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit

// This Extension allows you too easily add constratints to UIViews
// You can add top,bottom,leading,trailing, centerY, and cneterX anchors and padding on all each side(with UIEdgeInsets)
// All Parameters are optional
extension UIView{
    func anchor(top:NSLayoutYAxisAnchor?,bottom:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,trailing:NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, centerX:NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true

        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true

        }
        if let bottom=bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true

        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        if let centerY = centerY{
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX{
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
    }
}
