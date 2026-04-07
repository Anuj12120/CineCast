//
//  Extensions.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

public extension UIDevice {

    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    class var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }

    class var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
}

extension String {
    var localized: String {
        return LanguageManager.shared.localizedString(for: self)
    }
}


extension UILabel {

    func setClickableText(
        fullText: String,
        clickableText: String,
        normalColor: UIColor = .label,
        clickableColor: UIColor = .systemBlue,
        font: UIFont = .systemFont(ofSize: 14),
        tapAction: @escaping () -> Void
    ) {

        self.isUserInteractionEnabled = true
        self.numberOfLines = 0

        let attributedString = NSMutableAttributedString(string: fullText)

        // Full text style
        attributedString.addAttributes([
            .foregroundColor: normalColor,
            .font: font
        ], range: NSRange(location: 0, length: fullText.count))

        // Clickable text range
        let clickableRange = (fullText as NSString).range(of: clickableText)

        attributedString.addAttributes([
            .foregroundColor: clickableColor,
        ], range: clickableRange)

        self.attributedText = attributedString

        // Remove old gesture if any
        self.gestureRecognizers?.forEach { self.removeGestureRecognizer($0) }

        let tapGesture = UITapGestureRecognizer()
        tapGesture.addAction {
            let location = tapGesture.location(in: self)

            if self.didTapAttributedText(in: clickableRange, at: location) {
                tapAction()
            }
        }

        self.addGestureRecognizer(tapGesture)
    }

    private func didTapAttributedText(in range: NSRange, at point: CGPoint) -> Bool {
        guard let attributedText = self.attributedText else { return false }

        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)

        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        let index = layoutManager.characterIndex(
            for: point,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )

        return NSLocationInRange(index, range)
    }
}

private var actionKey: UInt8 = 0

extension UIGestureRecognizer {

    private class ActionWrapper {
        let action: () -> Void
        init(action: @escaping () -> Void) {
            self.action = action
        }
    }

    func addAction(_ action: @escaping () -> Void) {
        let wrapper = ActionWrapper(action: action)
        objc_setAssociatedObject(self, &actionKey, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(handleAction))
    }

    @objc private func handleAction() {
        if let wrapper = objc_getAssociatedObject(self, &actionKey) as? ActionWrapper {
            wrapper.action()
        }
    }
}
