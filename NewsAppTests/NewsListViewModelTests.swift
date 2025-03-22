//
//  NewsListViewModelTests.swift
//  NewsAppTests
//
//  Created by Manikandan on 22/03/25.
//

import XCTest
@testable import NewsApp

final class NewsListViewModelTests: XCTestCase {
    var viewModel: NewsListViewModel!
    var mockAPIService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        viewModel = NewsListViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func testFetchNewsUpdatesArticles() async {
        await viewModel.fetchNews()
        XCTAssertEqual(viewModel.articles.count, 2, "Expected 2 mock articles")
    }
}
