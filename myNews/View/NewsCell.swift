//
//  NewsCell.swift
//  myNews
//
//  Created by Данил Четвертаков on 13/04/2025.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    static let identifier = "NewsCell"
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, dateLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для конфигурации ячейки с данными
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        dateLabel.text = article.publishedAt // или другой формат даты
    }
}


