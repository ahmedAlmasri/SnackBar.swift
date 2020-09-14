//
//  ViewController.swift
//  SnackBar.swift
//
//  Created by ahmed.almasri@ymail.com on 09/11/2020.
//  Copyright (c) 2020 ahmed.almasri@ymail.com. All rights reserved.
//

import UIKit
import SnapKit
import SnackBar_swift

class ViewController: UIViewController {

	let button: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Show", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		return button
	}()
    override func viewDidLoad() {
        super.viewDidLoad()
       
		self.view.addSubview(button)
		
		button.snp.makeConstraints  {
			$0.center.equalTo(self.view)
		}
    }
	
	@objc func buttonTapped(_ sender: UIButton) {
		
		AppSnackBar.make(in: self.view, message: "The Internet connection appears to be offline.", duration: .lengthLong).setAction(with: "Retry", action: {
			
		}).show()
	}
}

class AppSnackBar: SnackBar {
	
	override var style: SnackBarStyle {
		var style = SnackBarStyle()
		style.background = .red
		style.textColor = .green
		return style
	}
}
