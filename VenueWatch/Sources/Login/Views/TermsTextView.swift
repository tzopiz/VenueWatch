//
//  TermsTextView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

class TermsTextView: UITextView {
    convenience init(_ str: String) {
        self.init()
        let attributedString = NSMutableAttributedString(string: str)
        let addAttributesRanges = (
            terms: App.string.termsConditions(),
            policy: App.string.privacyPolicy()
        )
        let language = App.currentLanguage
        attributedString.addAttribute(
            .link,
            value: "https://policies.google.com/terms?hl=\(language)-US",
            range: (attributedString.string as NSString).range(of: addAttributesRanges.terms)
        )
        attributedString.addAttribute(
            .link,
            value: "https://policies.google.com/privacy?hl=\(language)-US",
            range: (attributedString.string as NSString).range(of: addAttributesRanges.policy)
        )
        linkTextAttributes = [.foregroundColor: App.Color.accentColor]
        backgroundColor = .clear
        attributedText = attributedString
        textAlignment = .center
        textColor = App.Color.label
        isSelectable = true
        isEditable = false
        delaysContentTouches = false
        isScrollEnabled = false
        dataDetectorTypes = .link
    }
}
