//
//  SnackBar+Duration.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/11/20.
//

import UIKit

extension SnackBar {
	
	public enum Duration: Equatable {
		case long
		case short
		case infinite
		case custom(CGFloat)
		
		var value: CGFloat {
			
			switch self {
			
			case .long:
				return 3
			case .short:
                return 1.5
			case .infinite:
				return -1
			case .custom(let duration):
				return duration
			}
		}
	}
}
