import UIKit
import UIComponents

final class NotesCollectionViewCell: BaseCollectionViewCell {
    override class var reuseIdentifier: String { String(describing: NotesCollectionViewCell.self) }
    typealias Note = NotesViewModel.Note
    
    private let textNote = BaseLabel()
    private let imageViewNote = UIImageView()
    private let stackView = BaseStackView(axis: .vertical, spacing: 8)
    private let profileView = ProfileView()
    private let footerView = FooterNoteView()
    
    override func configure(_ parametr: Any) {
        guard let parametr = parametr as? Note else { return }
        self.textNote.text = parametr.text
        let image = UIImage(data: parametr.content)
        if let originalImage = image {
            let screenWidth = UIScreen.main.bounds.width - 16
            let scaledImage = originalImage.scaled(to: screenWidth)
            self.imageViewNote.image = scaledImage
        }
        self.footerView.configure(likesCount: parametr.likeCount)
        self.profileView.configure(
            fullName: parametr.person.fullName,
            username: parametr.person.username,
            imageData: parametr.person.image
        )
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
