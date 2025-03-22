//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

import Foundation

/// ViewModel for managing and providing news data to the UI
class NewsListViewModel {
    private var isLoading = false
    private var currentPage = 1
    private let pageSize = 10
    private let apiService: APIServiceProtocol  // Dependency Injection
    
    var articles: [NewsArticle] = []
    
    /**
     * Initializes the view model with a given API service.
     * - Parameter apiService: APIServiceProtocol instance (default: APIService()).
     */
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    /**
     * Fetches the latest news and updates the newsArticles list.
     */
    func fetchNews() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newArticles = try await apiService.fetchNews(page: currentPage, pageSize: pageSize)
            DispatchQueue.main.async {
                self.articles.append(contentsOf: newArticles)
                self.currentPage += 1
            }
        } catch {
            print("Error fetching news: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}
