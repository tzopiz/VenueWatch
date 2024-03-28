//
//  ProfileView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/28/24.
//

import UIKit

final class ProfileView: BaseView {
    private let name = BaseLabel()
    private let username = BaseLabel()
    private let imageView = UIImageView()
    private let nameStackView = BaseStackView(axis: .vertical, spacing: 4)
    
    func configure(fullName: String, username: String, imageData: Data?) {
        self.name.text = fullName
        self.username.text = username
        if let imageData = imageData {
            self.imageView.image = UIImage(data: imageData)
        } else {
            self.imageView.image = App.Image.emptyProfile
        }
    }
}

// MARK: - Configure
extension ProfileView {
    override func setupViews() {
        super.setupViews()
        addSubviews(imageView, nameStackView)
        nameStackView.addArrangedSubviews(name, username)
    }
    override func layoutViews() {
        super.layoutViews()
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.width.equalTo(50)
        }
        nameStackView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(8)
        }
    }
    override func configureViews() {
        super.configureViews()
    }
}
