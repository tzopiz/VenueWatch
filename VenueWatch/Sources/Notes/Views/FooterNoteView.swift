//
//  FooterNoteView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/28/24.
//

import UIKit

final class FooterNoteView: BaseView {
    private let likesButton = BaseButton()
    private let dislikeButton = BaseButton()
    private let commentButton = BaseButton()
    private let shareButton = BaseButton()
    private let buttonsStackView = BaseStackView(axis: .horizontal)
    func configure(likesCount: Int) {
        let random = Int.random(in: 0..<100000)
        self.likesButton.setTitle("\(random)К", for: .normal)
        self.dislikeButton.setTitle("\(random)3544", for: .normal)
    }
}

// MARK: - Configure
extension FooterNoteView {
    override func setupViews() {
        super.setupViews()
        addSubviews(buttonsStackView, shareButton)
        buttonsStackView.addArrangedSubviews(likesButton, dislikeButton, commentButton)
    }
    override func layoutViews() {
        super.layoutViews()
        buttonsStackView.snp.makeConstraints { $0.leading.top.bottom.equalToSuperview() }
        shareButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(50)
        }
    }
    override func configureViews() {
        super.configureViews()
        
        likesButton.setImage(App.Image.likes, for: .normal)
        dislikeButton.setImage(App.Image.dislike, for: .normal)
        commentButton.setImage(App.Image.comment, for: .normal)
        shareButton.setImage(App.Image.share, for: .normal)
        
        likesButton.addTarget(self, action: #selector(likesButtonTapped), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeButtonTapped), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension FooterNoteView {
    @IBAction func likesButtonTapped() {
        likesButton.setImage(App.Image.likesFill, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.likesButton.setImage(App.Image.likes, for: .normal)
        }
    }
    @IBAction func dislikeButtonTapped() {
        dislikeButton.setImage(App.Image.dislikeFill, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dislikeButton.setImage(App.Image.dislike, for: .normal)
        }
    }
    @IBAction func commentButtonTapped() { print(#function) }
    @IBAction func shareButtonTapped() { print(#function) }
}
