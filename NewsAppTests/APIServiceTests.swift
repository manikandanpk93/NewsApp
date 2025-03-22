//
//  APIServiceTests.swift
//  NewsAppTests
//
//  Created by Manikandan on 22/03/25.
//

import Testing
import XCTest
@testable import NewsApp

final class APIServiceTests: XCTestCase {
    var apiService: APIServiceProtocol!
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
    }
    
    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    func testFetchNewsSuccess() async throws {
        let articles = try await apiService.fetchNews(page: 1, pageSize: 10)
        XCTAssertFalse(articles.isEmpty, "News articles should not be empty")
    }
    
    func testFetchLikesSuccess() async throws {
        let likes = try await apiService.fetchLikes(articleId: "test-article")
        XCTAssertGreaterThanOrEqual(likes, 0, "Likes should be a non-negative integer")
    }
    
    func testFetchCommentsSuccess() async throws {
        let comments = try await apiService.fetchComments(articleId: "test-article")
        XCTAssertGreaterThanOrEqual(comments, 0, "Comments should be a non-negative integer")
    }
}
