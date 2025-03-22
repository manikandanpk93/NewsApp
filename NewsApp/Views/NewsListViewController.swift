//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

/**
 * NewsApp - Fetches and displays the latest US news headlines.
 *
 * This project follows the MVVM architecture, uses async/await for networking,
 * caches images with SDWebImage, and supports pagination in the news list.
 */

import UIKit

/// News List View Controller displaying a paginated list of articles
class NewsListViewController: UIViewController {
    
    @IBOutlet weak var newsListTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var viewModel = NewsListViewModel()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNews()
    }
    
    private func setupUI() {
        title = "News"
        newsListTableView.registerNib(name: NewsListTableViewCell.name)
    }
    
    private func fetchNews() {
        loadingIndicator.startAnimating()
        
        Task {
            await viewModel.fetchNews()
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                self.newsListTableView.reloadData()
            }
        }
        
        //        viewModel.fetchNews {
        //            DispatchQueue.main.async {
        //                self.loadingIndicator.stopAnimating()
        //                self.newsListTableView.reloadData()
        //            }
        //        }
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsListTableViewCell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.name, for: indexPath) as! NewsListTableViewCell
        let article = viewModel.articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.row]
        let detailVC: NewsDetailsTableViewController = UIStoryboard.newsSB.instantiateViewController(withIdentifier: NewsDetailsTableViewController.name) as! NewsDetailsTableViewController
        detailVC.article = article
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Pagination Logic
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.articles.count - 1 {  // Last cell
            fetchNews()  // Load next page
        }
    }
}
