//
//  AuthHeaderView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/19/24.
//

import UIKit
import SnapKit

final class AuthHeaderView: BaseView {
    
    private let logoImageView = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
    private let label = BaseLabel(
        text: App.string.signUp(),
        textColor: App.color.label,
        fontSize: 32,
        fontType: .bold,
        textAlignment: .center
    )
    private let secondaryLabel = BaseLabel(
        text: App.string.welcome(),
        textColor: App.color.secondaryLabel,
        fontSize: 18,
        textAlignment: .center
    )
    private let stackView = BaseStackView(axis: .vertical)
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
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
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
