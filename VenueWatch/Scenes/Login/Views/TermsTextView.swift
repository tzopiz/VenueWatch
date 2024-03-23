//
//  TermsTextView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

public class TermsTextView: UITextView {
    convenience init(_ str: String) {
        self.init()
        let attributedString = NSMutableAttributedString(string: str)
        
        let addAttributesRanges = (
            terms: App.string.termsConditions(),
            policy: App.string.privacyPolicy()
        )
        
        attributedString.addAttribute(
            .link,
            value: "terms://termsAndConditions",
            range: (attributedString.string as NSString).range(of: addAttributesRanges.terms)
        )
        attributedString.addAttribute(
            .link,
            value: "privacy://privacyPolicy",
            range: (attributedString.string as NSString).range(of: addAttributesRanges.policy)
        )
        
        linkTextAttributes = [.foregroundColor: App.color.accentColor]
        backgroundColor = .clear
        attributedText = attributedString
        textAlignment = .center
        textColor = App.color.label
        isSelectable = true
        isEditable = false
        delaysContentTouches = false
        isScrollEnabled = false
    }
}
