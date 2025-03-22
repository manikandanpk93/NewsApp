//
//  MockAPIService.swift
//  NewsAppTests
//
//  Created by Manikandan on 22/03/25.
//

@testable import NewsApp

final class MockAPIService: APIServiceProtocol {
    func fetchNews(page: Int, pageSize: Int) async throws -> [NewsArticle] {
        return [
            NewsArticle(title: "Mock News 1", description: "Desc1", content: "Content 1", url: "www.google.com", urlToImage: nil, author: "TestAuthor1", publishedAt: nil),
            NewsArticle(title: "Mock News 2", description: "Desc2", content: "Content 2", url: "www.instagram.com", urlToImage: nil, author: "TestAuthor2", publishedAt: nil),
            NewsArticle(title: "Mock News 3", description: "Desc3", content: "Content 3", url: "www.facebook.com", urlToImage: nil, author: "TestAuthor3", publishedAt: nil)
        ]
    }
    
    func fetchLikes(articleId: String) async throws -> Int {
        return 10
    }
    
    func fetchComments(articleId: String) async throws -> Int {
        return 5
    }
}
