//
//  UIImageView.swift
//  PipeDrive
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func load(withImageUrl urlString: String?) {
        if let urlString = urlString, let url = URL(string: urlString) {
            let imageResource = ImageResource(downloadURL: url)
            self.kf.setImage(with: imageResource, placeholder: nil, options:  [.transition(.fade(0.3))])
        } else {
            self.image = nil
        }
    }
}
