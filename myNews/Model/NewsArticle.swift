//
//  NewsArticle.swift
//  myNews
//
//  Created by Данил Четвертаков on 14/04/2025.
//

import Foundation


struct NewsArticle: Decodable{
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let source: Source
   
}
