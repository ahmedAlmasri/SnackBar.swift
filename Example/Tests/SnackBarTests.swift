import XCTest
@testable import SnackBar_swift
import SnapKit

class SnackBarTests: XCTestCase {
	let controller = UIViewController()
	var snackBar: SnackBar!
	let message = "test message"
    override func setUp() {
        super.setUp()
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = controller
		window.makeKeyAndVisible()
		
		controller.loadView()
		snackBar = SnackBar.make(in: controller.view, message: message, duration: .lengthLong)

    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testInitCoder() {
		
	XCTAssertNil(SnackBar(coder: NSCoder()))
	
	}
	func testInitView() {
		
		
		let stackView = snackBar.subviews
		XCTAssertEqual(stackView.count, 1)
		XCTAssertTrue(stackView.first is UIStackView)
		XCTAssertEqual((stackView.first as? UIStackView)?.arrangedSubviews.count , 1)
	}
	
	func testConstraints() {
		
		XCTAssertTrue(hasConstraint(attribute: .bottom, constant: CGFloat(-snackBar.style.inViewPadding), view: snackBar))

		XCTAssertTrue(hasConstraint(attribute: .top, constant: CGFloat(snackBar.style.inViewPadding), view: snackBar))

		XCTAssertTrue(hasConstraint(attribute: .leading, constant: CGFloat(snackBar.style.inViewPadding), view: snackBar))

		XCTAssertTrue(hasConstraint(attribute: .trailing, constant: CGFloat(-snackBar.style.inViewPadding), view: snackBar))
		
	}
	
	func testSwipeAction() {
		XCTAssertTrue(hasGestureRecognizer(direction: .left))
		XCTAssertTrue(hasGestureRecognizer(direction: .right))
		XCTAssertTrue(hasGestureRecognizer(direction: .up))
		XCTAssertTrue(hasGestureRecognizer(direction: .down))
	}
	
	func testMessageLabel() {
		
		let label = snackBar.subviews.first?.subviews.first as? UILabel
		XCTAssertEqual(label?.text, message)
	}
	
	
	func testSetAction() {
		let actionTitle = "retry"
		_ = snackBar.setAction(with: actionTitle) { }
		let button = snackBar.subviews.first?.subviews.last as? UIButton
		
		XCTAssertEqual(button?.titleLabel?.text, actionTitle)		
		XCTAssertEqual(button?.actions(
				forTarget: button!,
				forControlEvent: .touchUpInside)?.first, "triggerActionHandler")
	}
	
	func testShowDismiss() {
		
		snackBar.show()
		XCTAssertTrue(controller.view.subviews.contains(snackBar))
				
		XCTAssertTrue(hasConstraint(attribute: .bottom, constant: CGFloat(-5), view: controller.view))

		snackBar.dismiss()
		
		XCTAssertTrue(hasConstraint(attribute: .bottom, constant: CGFloat(200), view: controller.view))
		let removeFromSuper = expectation(description: "removeFromSuper")
		
		DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(SnackBar.Duration.lengthLong.value)) {
			
			removeFromSuper.fulfill()
		}
		wait(for: [removeFromSuper], timeout: 5)
		XCTAssertTrue(controller.view.subviews.isEmpty)

	}
    
	private func hasGestureRecognizer(direction: UISwipeGestureRecognizer.Direction) -> Bool {
		
		snackBar.gestureRecognizers?.contains(where: {
			if let gesture = ($0 as? UISwipeGestureRecognizer) {
			
				return gesture.direction == direction && gesture.numberOfTouchesRequired == 1
			}
			return false
		}) ?? false
	}
	
	private func hasConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat, view: UIView) -> Bool {
		
		view.constraints.contains(where: {
			$0.firstAttribute.rawValue == attribute.rawValue && $0.constant == constant
		})
	}
}
