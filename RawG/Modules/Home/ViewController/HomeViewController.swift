//
//  HomeViewController.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit

protocol HomeView: AnyObject {

}

final class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol!

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeView {

}
