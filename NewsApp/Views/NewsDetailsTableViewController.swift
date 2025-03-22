//
//  NewsDetailsTableViewController.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

class NewsDetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var readMoreButton: UIButton!
    
    var article: NewsArticle?
    private let apiService = APIService()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialSetup()
        setupUI()
        fetchLikesAndComments()
    }
    
    private func performInitialSetup() {
        titleLabel.text = ""
        descriptionLabel.text = ""
        readMoreButton.isHidden = true
        newsImageView.image = UIImage(named: "placeholder")
    }
    
    private func setupUI() {
        titleLabel.text = article?.title
        
        if let content = article?.content {
            let contentArr = content.components(separatedBy: "[+")
            let isContentTruncated = (contentArr.count > 1)
            let cleanedContent = contentArr.first ?? content
            descriptionLabel.text = cleanedContent
            readMoreButton.isHidden = !isContentTruncated
        }
        else {
            readMoreButton.isHidden = false
        }
        
        if let imageUrl = article?.urlToImage, let url = URL(string: imageUrl) {
            newsImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        }
        else {
            newsImageView.image = UIImage(named: "placeholder")
        }
    }
    
    private func fetchLikesAndComments() {
        guard let articleId = article?.url.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "/", with: "-") else { return }
        
        Task {
            do {
                let likes = try await apiService.fetchLikes(articleId: articleId)
                let comments = try await apiService.fetchComments(articleId: articleId)
                
                DispatchQueue.main.async {
                    self.likesLabel.text = "\(likes)"
                    self.commentsLabel.text = "\(comments)"
                }
            } catch {
                DispatchQueue.main.async {
                    self.likesLabel.text = "0"
                    self.commentsLabel.text = "0"
                }
                print("Error fetching likes/comments: \(error)")
            }
        }
    }
    
    
    // MARK: - IBAction
    
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
        if let urlString = article?.url, let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: - Table view data source

extension NewsDetailsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return UITableView.automaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
