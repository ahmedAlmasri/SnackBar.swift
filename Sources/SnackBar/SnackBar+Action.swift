//
//  SnackBar+Action.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/11/20.
//

import UIKit

extension UIButton {
    enum Trager { static var action: (() -> Void)? }
    private func actionHandler(action: (() -> Void)? = nil) {
        if action != nil {
            Trager.action = action

        } else {
            Trager.action?()
        }
    }

    @objc private func triggerActionHandler() {
        actionHandler()
    }

    func actionHandler(controlEvents control: UIControl.Event, ForAction action: @escaping () -> Void) {
        actionHandler(action: action)
        addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}
