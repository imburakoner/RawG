//
//  HomeSectionHeaderView.swift
//  RawG
//
//  Created by Burak Oner on 15.11.2021.
//

import UIKit

final class HomeSectionHeaderView: UICollectionReusableView {

    static let kind: String = "section-header-element-kind"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = .darkText
        label.numberOfLines = 1
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .darkText
        label.numberOfLines = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 8)
        ])
    }

    func configure(title: String = "", subTitle: String = "") {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }

}
