//
//  NotesCollectionViewCell.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

final class NotesCollectionViewCell: BaseCollectionViewCell {
    override class var reuseIdentifier: String { String(describing: NotesCollectionViewCell.self) }
    typealias Note = NotesViewModel.Note
    
    private let textNote = BaseLabel()
    private let imageViewNote = UIImageView()
    private let stackView = BaseStackView(axis: .vertical, spacing: 8)
    private let profileView = ProfileView()
    private let footerView = FooterNoteView()
    
    override func configure(_ parametrs: Any...) {
        parametrs.forEach { parametr in
            guard let parametr = parametr as? Note else { return }
            let text = parametr.text
            self.textNote.text = Array<String>(repeating: text, count: Int.random(in: 2..<50)).joined()
            let image = App.Image.testImages.randomElement()!
            if let originalImage = image {
                let screenWidth = UIScreen.main.bounds.width - 16
                let scaledImage = originalImage.scaledToWidth(screenWidth)
                self.imageViewNote.image = scaledImage
            }
            self.footerView.configure(likesCount: parametr.likeCount)
            self.profileView.configure(
                fullName: parametr.person.fullName,
                username: parametr.person.username,
                imageData: parametr.person.image
            )
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageViewNote.image = nil
        self.textNote.text = nil
    }
}

// MARK: - Configure
extension NotesCollectionViewCell {
    override func setupViews() {
        super.setupViews()
        addSubviews(stackView)
        stackView.addArrangedSubviews(profileView, imageViewNote, textNote, footerView)
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        footerView.snp.makeConstraints { $0.height.equalTo(32) }
    }
    override func configureViews() {
        super.configureViews()
        backgroundColor = App.Color.systemBackground
        layer.cornerRadius = 10
    }
}
