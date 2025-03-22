//
//  NewsDetailsTableViewControllerTests.swift
//  NewsAppTests
//
//  Created by Manikandan on 22/03/25.
//

import XCTest
@testable import NewsApp

final class NewsDetailsTableViewControllerTests: XCTestCase {
    var viewController: NewsDetailsTableViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard.newsSB.instantiateViewController(identifier: "NewsDetailsTableViewController") as? NewsDetailsTableViewController
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testLabelsAreUpdated() {
        let article = NewsArticle(title: "Mock News 1", description: "Desc1", content: "Content 1", url: "www.google.com", urlToImage: nil, author: "TestAuthor1", publishedAt: nil)
        viewController.article = article
        viewController.viewDidLoad()
    }
}
