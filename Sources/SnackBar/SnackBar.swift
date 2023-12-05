//
//  SnackBar.swift
//  CommonUI
//
//  Created by Ahmad Almasri on 9/7/20.
//

import Foundation
import SnapKit
import UIKit

public protocol SnackBarAction {
    func setAction(with title: String, action: (() -> Void)?) -> SnackBarPresentable
}

public protocol SnackBarPresentable {
    func show()
    func dismiss()
}

open class SnackBar: UIView, SnackBarAction, SnackBarPresentable {
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(
            arrangedSubviews: [messageLabel]
        )
        mainStackView.axis = .horizontal
        mainStackView.spacing = 10
        return mainStackView
    }()

    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.numberOfLines = Int(style.maxNumberOfLines)
        messageLabel.font = style.font
        messageLabel.textColor = style.textColor
        messageLabel.adjustsFontSizeToFitWidth = true
        messageLabel.minimumScaleFactor = 0.8
        return messageLabel
    }()

    private lazy var actionButton: UIButton = {
        let actionButton = UIButton(type: .system)
        actionButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        actionButton.setContentHuggingPriority(.required, for: .horizontal)
        actionButton.setTitleColor(
            style.actionTextColor
                .withAlphaComponent(style.actionTextColorAlpha),
            for: .normal
        )
        actionButton.titleLabel?.font = style.actionFont
        return actionButton
    }()

    public var message: String {
        didSet {
            messageLabel.text = message
        }
    }

    private let contextView: UIView
    private let duration: Duration
    private var dismissTimer: Timer?
    private let style: SnackBarStyle

    public required init(contextView: UIView, message: String, duration: Duration, style: SnackBarStyle = SnackBarStyle()) {
        self.contextView = contextView
        self.message = message
        self.duration = duration
        self.style = style
        super.init(frame: .zero)
        backgroundColor = style.background
        layer.cornerRadius = style.cornerRadius
        setupView()
        setupSwipe()
        messageLabel.text = message
    }

    public required init?(coder: NSCoder) {
        return nil
    }

    private func constraintSuperView(with view: UIView) {
        view.setupSubview(self) {
            $0.makeConstraints {
                $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(200)
                $0.leading.equalTo(view.safeAreaLayoutGuide).offset(style.padding)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-style.padding)
            }
        }
    }

    private func setupView() {
        setupSubview(mainStackView) {
            $0.makeConstraints {
                $0.bottom.trailing.equalTo(self).offset(-style.inViewPadding)
                $0.top.leading.equalTo(self).offset(style.inViewPadding)
            }
        }
    }

    private func setupSwipe() {
        addSwipeGestureAllDirection(action: #selector(swipeAction(_:)))
    }

    @objc private func swipeAction(_ sender: UISwipeGestureRecognizer) {
        dismiss()
    }

    private static func removeOldViews(form view: UIView) {
        view.subviews
            .filter { $0 is Self }
            .forEach { $0.removeFromSuperview() }
    }

    private func animation(with offset: CGFloat, completion: ((Bool) -> Void)? = nil) {
        superview?.layoutIfNeeded()

        snp.updateConstraints {
            $0.bottom.equalTo(self.contextView.safeAreaLayoutGuide).offset(offset)
        }
        UIView.animate(
            withDuration: 1.2,
            delay: 0.0, usingSpringWithDamping: 0.9,
            initialSpringVelocity: 0.7, options: .curveEaseOut,
            animations: {
                self.superview?.layoutIfNeeded()
            }, completion: completion
        )
    }

    private func invalidDismissTimer() {
        dismissTimer?.invalidate()
        dismissTimer = nil
    }

    // MARK: - Public Methods

    public static func make(in view: UIView, message: String, duration: Duration, style: SnackBarStyle) -> Self {
        removeOldViews(form: view)
        return Self(contextView: view, message: message, duration: duration, style: style)
    }

    public func setAction(with title: String, action: (() -> Void)? = nil) -> SnackBarPresentable {
        mainStackView.addArrangedSubview(actionButton)
        actionButton.setTitle(title, for: .normal)
        actionButton.actionHandler(controlEvents: .touchUpInside) { [weak self] in
            self?.dismiss()
            action?()
        }

        return self
    }

    public func show() {
        constraintSuperView(with: contextView)
        animation(with: -(CGFloat(style.padding) + style.anchor)) { _ in

            if self.duration != .infinite {
                self.dismissTimer = Timer(
                    timeInterval: TimeInterval(self.duration.value),
                    target: self, selector: #selector(self.dismiss),
                    userInfo: nil, repeats: false
                )
                RunLoop.main.add(self.dismissTimer!, forMode: .common)
            }
        }
    }

    @objc public func dismiss() {
        invalidDismissTimer()

        animation(with: 200, completion: { _ in
            self.removeFromSuperview()
        })
    }
}
