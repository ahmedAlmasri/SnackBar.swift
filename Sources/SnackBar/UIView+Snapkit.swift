//
//  UIView+Snapkit.swift
//  Pods-SnackBar.swift_Example
//
//  Created by Ahmad Almasri on 9/14/20.
//

import SnapKit
import UIKit

extension UIView {
    func setupSubview(_ subview: UIView, setup: (ConstraintViewDSL) -> Void) {
        addSubview(subview)
        setup(subview.snp)
    }
}
