//
//  NewsViewModel.swift
//  myNews
//
//  Created by Данил Четвертаков on 14/04/2025.
//

import Foundation



class NewsViewModel{
    private let service = NewsService()
    var news: [NewsArticle] = []
    
    func fetchNews(completion: @escaping () -> Void){
        service.fetchNews {[weak self]articles in
            self?.news = articles
            completion()
        }
    }
    
}
