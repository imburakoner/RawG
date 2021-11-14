//
//  HomeDataSource.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

class HomeDataSource {

    private typealias Cell = FeaturedGameCell
    private typealias CellRegistration = UICollectionView.CellRegistration<Cell, FeaturedGameCellModel>

    var dataSource: UICollectionViewDiffableDataSource<HomeSections, FeaturedGameCellModel>

    init(collectionView: UICollectionView) {

        let registration = CellRegistration { cell, indexPath, cellModel in
            cell.configure(with: cellModel)
        }


        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, cellModel in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: cellModel)
        }

    }

    func add(items: [FeaturedGameCellModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<HomeSections, FeaturedGameCellModel>()
        snapshot.appendSections([.featured])
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
