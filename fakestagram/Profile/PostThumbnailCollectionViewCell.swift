//
//  PostThumbnailCollectionViewCell.swift
//  fakestagram
//
//  Created by LuisE on 5/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostThumbnailCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "postThumbnailCell"
    @IBOutlet weak var imageView: UIImageView!

    var post: Post? {
        didSet { updateImageView() }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateImageView() {
        guard let post = post else { return }
        post.load { [weak self] img in
            self?.imageView.image = img
        }
    }

}
