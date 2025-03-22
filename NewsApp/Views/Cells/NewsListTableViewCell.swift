//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit
import SDWebImage

/// Custom table view cell for displaying news articles
class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    // MARK: - 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        performInitialSetup()
    }
    
    private func performInitialSetup() {
        newsImageView.image = UIImage(named: "placeholder")
        titleLabel.text = ""
        descLabel.text = ""
    }
    
    /**
     * Configures the cell with a news article.
     * - Parameter article: The news article to display.
     */
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        descLabel.text = article.description ?? "No description available"
        
        if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
            newsImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        }
        else {
            newsImageView.image = UIImage(named: "placeholder")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        performInitialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
