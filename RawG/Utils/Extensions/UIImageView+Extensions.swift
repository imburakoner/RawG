//
//  UIImageView+Extensions.swift
//  RawG
//
//  Created by Burak Oner on 14.11.2021.
//

import UIKit
import Kingfisher

extension UIImageView {

    func load(with url: URL?) {
        kf.setImage(with: url)
    }

}
