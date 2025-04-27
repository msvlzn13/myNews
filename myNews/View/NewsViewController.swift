//
//  NewsViewController.swift
//  myNews
//
//  Created by Данил Четвертаков on 13/04/2025.
//

import UIKit

class NewsViewController: UIViewController {
    private let viewModel = NewsViewModel()
    private let tableView = UITableView()
    private var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Szczecin News"
        
        view.backgroundColor = .systemBackground
        
        // Настройка таблицы
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.dataSource = self
        
        // Создание и настройка лейбла для ошибок
        errorLabel = UILabel()
        errorLabel.text = "Ошибка загрузки новостей."
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        view.addSubview(errorLabel)
        
        // Размещение таблицы на экране
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        // Загрузка новостей
        viewModel.fetchNews {
            DispatchQueue.main.async {
                if self.viewModel.news.isEmpty {
                    self.errorLabel.isHidden = false
                } else {
                    self.tableView.reloadData()
                    self.errorLabel.isHidden = true
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Размещение errorLabel внизу
        errorLabel.frame = CGRect(x: 0, y: view.bounds.height / 2 - 30, width: view.bounds.width, height: 60)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.news[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        cell.configure(with: item) // Передаем статью в ячейку
        return cell
    }
}

