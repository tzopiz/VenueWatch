//
//  LabelCollectionViewCell.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/25/24.
//

import UIKit

class LabelCollectionViewCell: BaseCollectionViewCell {
    override class var reuseIdentifier: String { String(describing: LabelCollectionViewCell.self) }
    private let label = BaseLabel(
        textColor: App.Color.label,
        fontSize: 17,
        fontType: .regular,
        textAlignment: .left
    )
    override func configure(_ parametrs: Any...) {
        for parametr in parametrs {
            if let title = parametr as? String {
                label.text = title
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
extension LabelCollectionViewCell {
    override func setupViews() {
        addSubviews(label)
    }
    override func layoutViews() {
        label.snp.makeConstraints { $0.edges.equalToSuperview().inset(4) }
    }
}
