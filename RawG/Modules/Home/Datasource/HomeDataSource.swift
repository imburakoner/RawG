//
//  HomeDataSource.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

class HomeDataSource {

    private typealias FeaturedGameCellRegistration = UICollectionView.CellRegistration<FeaturedGameCell,
                                                                                       FeaturedGameCellModel>

    private typealias TrendingGameCellRegistration = UICollectionView.CellRegistration<TrendingGameCell,
                                                                                       TrendingGameCellModel>

    var dataSource: UICollectionViewDiffableDataSource<HomeSections, AnyHashable>

    init(collectionView: UICollectionView) {

        let featuredGameCellRegistration = FeaturedGameCellRegistration { cell, _, cellModel in
            cell.configure(with: cellModel)
        }

        let trendingGameCellRegistration = TrendingGameCellRegistration { cell, indexPath, cellModel in
            cell.configure(with: cellModel)
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, cellModel in
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

    }

    func configure(with viewModel: HomeViewModel) {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSections, AnyHashable>()
        snapshot.appendSections([.trending, .featured])
        snapshot.appendItems(viewModel.trendingGameCellModels, toSection: .trending)
        snapshot.appendItems(viewModel.featuredGameCellModels, toSection: .featured)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
