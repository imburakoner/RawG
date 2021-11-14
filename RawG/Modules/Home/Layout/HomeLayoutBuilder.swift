//
//  HomeLayoutBuilder.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

enum HomeLayoutBuilder {

    static func build() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            guard let section = HomeSections(rawValue: section) else {
                assertionFailure("Unrecognized section with int value: \(section)")
                return nil
            }
            switch section {
            case .featured:
                return Self.buildFeaturedCollectionLayoutSection()
            case .trending:
                return Self.buildFeaturedCollectionLayoutSection()
            }
        }
    }

    private static func buildFeaturedCollectionLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .fractionalHeight(0.4))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        group.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

}

enum HomeSections: Int {
    case featured
    case trending
}
