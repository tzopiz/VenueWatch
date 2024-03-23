//
//  FooterButtonsView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/20/24.
//

import UIKit

final class FooterButtonsView: BaseView {
    enum ButtonTextView {
        case button(UIButton)
        case textView(UITextView)
        func view() -> UIView {
            switch self {
            case .button(let button): return button
            case .textView(let textView): return textView
            }
        }
    }
    private let authButton: BaseButton
    private let secondaryButton: ButtonTextView
    private let toggleButton: BaseButton
    private let secondaryButtonHeight: CGFloat
    private let stackView = BaseStackView(axis: .vertical)
    weak var delegate: PresentDelegate?
    
    let height: CGFloat
    
    init(type: LoginType) {
        let authButtonTitle: String,
            toggleButtonTitle: String
        switch type {
        case .signIn:
            height = 130
            secondaryButtonHeight = 50
            let button = BaseButton(App.string.secondaryButtonTitleSignIn())
            button.titleLabel?.font = App.font.rubik(style: .regular, size: 12)
            button.tintColor = App.color.label
            authButtonTitle = App.string.signIn()
            toggleButtonTitle = App.string.toggleButtonTitleSignIn()
            secondaryButton = .button(button)
        case .signUp:
            height = 160
            secondaryButtonHeight = 70
            let textView = TermsTextView(App.string.secondaryButtonTitleSignUp())
            secondaryButton = .textView(textView)
            authButtonTitle = App.string.signUp()
            toggleButtonTitle = App.string.toggleButtonTitleSignUp()
        }
        authButton = BaseButton(authButtonTitle)
        toggleButton = BaseButton(toggleButtonTitle)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSelectos(
        target: Any?,
        authButtonSelector: Selector,
        secondarySelector: Selector,
        toggleButtonSelector: Selector
    ) {
        authButton.addTarget(target, action: authButtonSelector, for: .touchUpInside)
        toggleButton.addTarget(target, action: toggleButtonSelector, for: .touchUpInside)
        switch secondaryButton {
        case .button(let button):
            button.addTarget(target, action: secondarySelector, for: .touchUpInside)
        case .textView(let textView):
            textView.delegate = self
        }
    }
}

// MARK: - Configure
extension FooterButtonsView {
    override func setupViews() {
        super.setupViews()
        addSubviews(stackView)
        stackView.addArrangedSubviews(
            authButton, secondaryButton.view(), toggleButton
        )
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints { make in
            make.center.leading.trailing.equalToSuperview()
        }
        authButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        secondaryButton.view().snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(secondaryButtonHeight)
        }
        toggleButton.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(40)
        }
    }
    override func configureViews() {
        super.configureViews()
        authButton.backgroundColor = App.color.accentColor
        authButton.titleLabel?.font = App.font.rubik(style: .bold, size: 21)
        authButton.tintColor = .white
        authButton.layer.cornerRadius = 10
        authButton.layer.borderWidth = 1
        authButton.layer.borderColor = App.color.accentColor.cgColor
        
        toggleButton.titleLabel?.font = App.font.rubik(style: .bold, size: 18)
    }
}

extension FooterButtonsView: UITextViewDelegate {
    
    func textView(
        _ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange,
        interaction: UITextItemInteraction
    ) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        }
        if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let webViewerController = WebViewerController(with: urlString)
        let navigationController = NavigationController(rootViewController: webViewerController)
        delegate?.present(viewController: navigationController, animated: true)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
