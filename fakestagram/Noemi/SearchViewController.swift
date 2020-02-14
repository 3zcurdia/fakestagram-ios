//
//  SearchViewController.swift
//  fakestagram
//
//  Created by Noemí Rod on 8/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!

    
    var posts = [Post]() //= {
//
//        let model = Model()
//
//        return model.postList
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = false
        
        for subView in searchController.searchBar.subviews {
            
            for subView1 in subView.subviews {
                
                if let textField = subView1 as? UITextField {
                    
                    textField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
                    textField.textAlignment = NSTextAlignment.center
                    
                }
            }
        }
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBarContainer
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
}
