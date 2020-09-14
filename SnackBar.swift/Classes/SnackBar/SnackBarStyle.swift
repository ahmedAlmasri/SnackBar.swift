//
//  SnackBarStyle.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/11/20.
//

import Foundation

public struct SnackBarStyle {
	public init() { }
	// Container
	public var background: UIColor = .systemGray6
	var padding = 5
	var inViewPadding = 20
	// Label
	public var textColor: UIColor = .label
	public var font: UIFont = UIFont.systemFont(ofSize: 14)
	var maxNumberOfLines: UInt = 2
	// Action
	public var actionTextColorAlpha: CGFloat = 0.5
	public var actionFont: UIFont = UIFont.systemFont(ofSize: 17)
	public var actionTextColor: UIColor = .red
}
