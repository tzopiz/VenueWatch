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
            self.textNote.text = parametr.text
            self.imageViewNote.image = App.Image.testImages.randomElement()!
            self.footerView.configure(likesCount: parametr.likeCount)
            self.profileView.configure(
                fullName: parametr.person.fullName,
                username: parametr.person.username,
                imageData: parametr.person.image
            )
        }
    }
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        addSubviews(stackView)
        stackView.addArrangedSubviews(profileView, imageViewNote, textNote, footerView)
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        footerView.snp.makeConstraints { $0.height.equalTo(32) }
    }
    override func configureViews() {
        super.configureViews()
        backgroundColor = App.Color.systemBackground
        layer.cornerRadius = 10
    }
}
