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
                return Self.buildTrendingCollectionLayoutSection()
            }
        }
    }

    private static func buildFeaturedCollectionLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .fractionalHeight(0.4))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        group.contentInsets = .init(top: 10, leading: 12, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }

    private static func buildTrendingCollectionLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                             heightDimension: .fractionalHeight(1.0)))

        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(170))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12)

        return section
    }

}

enum HomeSections: Int {
    case featured
    case trending
}
