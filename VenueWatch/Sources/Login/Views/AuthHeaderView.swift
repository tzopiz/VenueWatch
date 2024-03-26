//
//  AuthHeaderView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit

final class AuthHeaderView: BaseView {
    
    internal let label: BaseLabel
    internal let secondaryLabel: BaseLabel
    internal let stackView = BaseStackView(axis: .vertical)
    internal let logoImageView = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
    
    init(type: LoginType) {
        let labelText: String
        let secondaryLabelText: String
        switch type {
        case .signIn:
            labelText = App.string.signIn()
            secondaryLabelText = App.string.signIntoAccount()
        case .signUp:
            labelText = App.string.signUp()
            secondaryLabelText = App.string.createAccount()
        }
        self.label = BaseLabel(
            text: labelText,
            textColor: App.Color.label,
            fontSize: 32,
            fontType: .bold,
            textAlignment: .center
        )
        self.secondaryLabel = BaseLabel(
            text: secondaryLabelText,
            textColor: App.Color.secondaryLabel,
            fontSize: 18,
            textAlignment: .center
        )
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension AuthHeaderView {
    override func setupViews() {
        super.setupViews()
        addSubviews(stackView, logoImageView)
        stackView.addArrangedSubviews(label, secondaryLabel)
    }
    override func layoutViews() {
        super.layoutViews()
        logoImageView.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.width.height.equalTo(128)
        }
        stackView.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(8)
        }
    }
    override func configureViews() {
        super.configureViews()
        logoImageView.tintColor = .label
    }
}
