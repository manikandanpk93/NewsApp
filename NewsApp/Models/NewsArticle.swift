//
//  NewsArticle.swift
//  NewsApp
//
//  Created by Manikandan on 21/03/25.
//

import UIKit


struct NewsResponse: Codable {
    let articles: [NewsArticle]
}

/// Model representing a news article
struct NewsArticle: Codable {
    let title: String
    let description: String?
    let content: String?
    let url: String
    let urlToImage: String?
    let author: String?
    let publishedAt: String?
}
