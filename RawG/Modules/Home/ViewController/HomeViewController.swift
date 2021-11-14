//
//  HomeViewController.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

protocol HomeView: AnyObject {
    func configure(with viewModel: HomeViewModel)
}

final class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol!

    private var dataSource: HomeDataSource!

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            dataSource = HomeDataSource(collectionView: collectionView)
            collectionView.dataSource = dataSource.dataSource
            collectionView.collectionViewLayout = HomeLayoutBuilder.build()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension HomeViewController: HomeView {
    func configure(with viewModel: HomeViewModel) {
        dataSource.add(items: viewModel.games)
    }
}
