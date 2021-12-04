//
//  HomeDataSource.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

final class HomeDataSource: NSObject {

    private typealias FeaturedGameCellRegistration = UICollectionView.CellRegistration<FeaturedGameCell,
                                                                                       FeaturedGameCellModel>

    private typealias TrendingGameCellRegistration = UICollectionView.CellRegistration<TrendingGameCell,
                                                                                       TrendingGameCellModel>

    private typealias HeaderRegistration = UICollectionView.SupplementaryRegistration<HomeSectionHeaderView>

    var dataSource: UICollectionViewDiffableDataSource<HomeSections, AnyHashable>

    init(collectionView: UICollectionView) {

        let featuredGameCellRegistration = FeaturedGameCellRegistration { cell, _, cellModel in
            cell.configure(with: cellModel)
        }

        let trendingGameCellRegistration = TrendingGameCellRegistration { cell, _, cellModel in
            cell.configure(with: cellModel)
        }

        let headerRegistration = HeaderRegistration(elementKind:
                                                        HomeSectionHeaderView.kind) { headerView, _, indexPath in
            guard let section = HomeSections(rawValue: indexPath.section) else { return }
            switch section {
            case .featured:
                headerView.configure(title: "New and updated games", subTitle: "Fresh selection every week")
            case .trending:
                headerView.configure(title: "Trending games")
            }
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView:
                                                            collectionView) { collectionView, indexPath, cellModel in
            if let cellModel = cellModel as? FeaturedGameCellModel {
                return collectionView.dequeueConfiguredReusableCell(using: featuredGameCellRegistration,
                                                                    for: indexPath, item: cellModel)
            } else if let cellModel = cellModel as? TrendingGameCellModel {
                return collectionView.dequeueConfiguredReusableCell(using: trendingGameCellRegistration,
                                                                    for: indexPath, item: cellModel)
            } else {
                return nil
            }
        }

        dataSource.supplementaryViewProvider = { _, _, indexPath in
            collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration,
                                                                  for: indexPath)
        }

    }

    func configure(with viewModel: HomeViewModelProtocol) {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSections, AnyHashable>()
        snapshot.appendSections([.featured, .trending])
        snapshot.appendItems(viewModel.trendingGameCellModels, toSection: .trending)
        snapshot.appendItems(viewModel.featuredGameCellModels, toSection: .featured)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension HomeDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// TODO: - Configure Game selection from collection view.
    }
}
