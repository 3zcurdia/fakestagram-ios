//
//  ExploreCollectionViewCell.swift
//  fakestagram
//
//  Created by Noemí Rod on 8/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var exploreImage: UIImageView!
    
    public var post: Post? {
        didSet { updateView() }
    }
    
    private func reset() {
        exploreImage.image = nil
    }
    
    private func updateView() {
        reset()
        guard let post = self.post else { return }
        post.load { [weak self] img in
            self?.exploreImage.image = img
        }
      
    }
}
