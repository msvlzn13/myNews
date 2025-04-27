//
//  NewsService.swift
//  myNews
//
//  Created by Данил Четвертаков on 14/04/2025.
//

import Foundation





class NewsService{
    
    
    
    private let session: URLSession
        
        
        init(session: URLSession = URLSession.shared) {
            self.session = session
        }
        
    func getAPIKey() -> String? {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path),
           let plist = try? PropertyListSerialization.propertyList(from: xml, options: [], format: nil),
           let dictionary = plist as? [String: Any],
           let apiKey = dictionary["APIKey"] as? String {
            return apiKey
        }
        return nil
    }
    
        func fetchNews(completion: @escaping ([NewsArticle]) -> Void) {
            guard let apiKey = getAPIKey() else {
                        print("API key not found!")
                        completion([])
                        return
                    }
                    
                    
                    guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2025-03-27&sortBy=publishedAt&apiKey=\(apiKey)") else {
                        completion([])
                        return
                    }
            
            session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion([])
                    return
                }   
                
                if let json = String(data: data, encoding: .utf8){
                    print(json)
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(NewsResponse.self, from: data)
                    completion(result.articles)
                    
                } catch {
                    print("Error parsing: \(error)")
                    completion([])
                }
                
            }.resume()
        }
    
}




