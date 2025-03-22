//
//  APIService.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit

import Foundation

struct Config {
    static let newsAPIKey = "58a4d04f61bf41dea559d4d4375cc103"
}


/// API Service for fetching news and additional details
protocol APIServiceProtocol {
    func fetchNews(page: Int, pageSize: Int) async throws -> [NewsArticle]
    func fetchLikes(articleId: String) async throws -> Int
    func fetchComments(articleId: String) async throws -> Int
}

class APIService: APIServiceProtocol {
    /**
     * Fetches the latest US news headlines.
     * - Parameter page: Page number for pagination.
     * - Parameter pageSize: pageSize for limiting number of records fetched.
     * - Returns: Array of `NewsArticle` objects.
     */
    func fetchNews(page: Int, pageSize: Int) async throws -> [NewsArticle] {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&page=\(page)&pageSize=\(pageSize)&apiKey=\(Config.newsAPIKey)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
        return decodedResponse.articles
    }
    
    /**
     * Fetches the number of likes for a given article.
     * - Parameter articleID: Formatted article ID.
     * - Returns: Number of likes.
     */
    func fetchLikes(articleId: String) async throws -> Int {
        let urlString = "https://cn-news-info-api.herokuapp.com/likes/\(articleId)"
        return try await fetchCount(urlString: urlString)
    }
    
    /**
     * Fetches the number of comments for a given article.
     * - Parameter articleID: Formatted article ID.
     * - Returns: Number of comments.
     */
    func fetchComments(articleId: String) async throws -> Int {
        let urlString = "https://cn-news-info-api.herokuapp.com/comments/\(articleId)"
        return try await fetchCount(urlString: urlString)
    }
    
    private func fetchCount(urlString: String) async throws -> Int {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let count = Int(String(decoding: data, as: UTF8.self)) else {
            throw URLError(.cannotParseResponse)
        }
        
        return count
    }
}
