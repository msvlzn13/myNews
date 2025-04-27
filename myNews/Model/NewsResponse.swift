//
//  NewsResponse.swift
//  myNews
//
//  Created by Данил Четвертаков on 14/04/2025.
//

import Foundation


struct NewsResponse : Decodable{
    
    let articles: [NewsArticle]
}
