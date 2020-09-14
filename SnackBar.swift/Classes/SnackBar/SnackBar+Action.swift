//
//  SnackBar+Action.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/11/20.
//

import Foundation

extension UIButton {
	struct Trager { static var action :(() -> Void)? }
    private func actionHandler(action:(() -> Void)? = nil) {
		if action != nil {
			Trager.action = action
			
		} else {
			Trager.action?()
			
		}
    }
    @objc private func triggerActionHandler() {
        self.actionHandler()
    }
    func actionHandler(controlEvents control: UIControl.Event, ForAction action: @escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}
