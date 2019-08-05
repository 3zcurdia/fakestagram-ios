//
//  SearchBarContainerView.swift
//  fakestagram
//
//  Created by Noemí Rod on 8/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {

    let searchBar: UISearchBar
    
    init(customSearchBar: UISearchBar) {
        
        searchBar = customSearchBar
        
        super.init(frame: CGRect.zero)
        
        addSubview(searchBar)
    }
    
    convenience override init(frame: CGRect) {
        self.init(customSearchBar: UISearchBar())
        self.frame = frame
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        searchBar.frame = bounds
    }
    
}
