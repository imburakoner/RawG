//
//  NavigationBar.swift
//  RawG
//
//  Created by Burak Oner on 16.11.2021.
//

import UIKit

final class NavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        isTranslucent = true
        backgroundColor = .systemBackground
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}
