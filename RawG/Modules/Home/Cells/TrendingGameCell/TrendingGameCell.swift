//
//  TrendingGameCell.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

class TrendingGameCell: UICollectionViewCell {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TrendingGameCell {

    private func configureLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            contentView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])

        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }

    func configure(with cellModel: TrendingGameCellModel) {
        nameLabel.text = cellModel.name
        imageView.load(with: cellModel.imageURL)
    }
}
