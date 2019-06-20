//
//  PostDetailViewController.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    public var post: Post!
    static let reuseIdentifier = "postDetailVC"
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UITextView!
    @IBOutlet weak var likeCounterLbl: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    lazy var client = CommentClient(post: post)
    var comments: [Comment] = [] {
         didSet { commentsTableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignValues()
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
   
    override func viewWillAppear(_ animated: Bool) {
        client.all {[weak self] data in
            self!.comments =  data
        }
        commentsTableView.reloadData()
    }
    
    func assignValues(){
        guard let post = self.post else { return }
        post.load { [weak self] img in
            self?.imgView.image = img
        }
        if post.likesCount>1 {
            likeCounterLbl.text = "\(post.likesCount) likes"
        } else {
            likeCounterLbl.text = "\(post.likesCount) like"
        }
        
        titleLbl.text = post.title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTableView.dequeueReusableCell(withIdentifier:
            CommentTableViewCell.reuseIdentifier, for: indexPath) as! CommentTableViewCell
        cell.authorName.text = comments[indexPath.row].author?.name
        cell.contentTV.text = comments[indexPath.row].content
        cell.created.text = comments[indexPath.row].created_at
        
        return cell
    }
 
    @IBAction func addComment(_ sender: Any) {
        if let commentDetailVC = self.storyboard?.instantiateViewController(withIdentifier: CommentViewController.reuseIdentifier) as? CommentViewController {
            commentDetailVC.post = post
            self.navigationController?.present(commentDetailVC, animated: true,completion: nil)
//            commentDetailVC.delegate = self
        }
    }
    
    
}
