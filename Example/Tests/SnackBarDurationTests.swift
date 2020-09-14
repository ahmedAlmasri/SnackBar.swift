//
//  SnackBarDurationTests.swift
//  SnackBar.swift_Tests
//
//  Created by Ahmad Almasri on 9/14/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SnackBar_swift
import SnapKit

class SnackBarDurationTests: XCTestCase {

	func testDuration() {
		
		XCTAssertEqual(SnackBar.Duration.lengthLong.value, 3.5)
		XCTAssertEqual(SnackBar.Duration.lengthShort.value, 2)
		XCTAssertEqual(SnackBar.Duration.infinite.value, -1)
		XCTAssertEqual(SnackBar.Duration.custom(10).value, 10)

	}
}
