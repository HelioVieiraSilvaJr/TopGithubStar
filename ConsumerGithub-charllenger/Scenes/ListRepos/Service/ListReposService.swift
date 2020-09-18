//
//  ListReposService.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation

protocol ListReposServiceProtocol {
    func fetchRepos(pagination: Int, onComplete: @escaping ((Result<[Repo], APIError>) -> Void))
}

final class ListReposService: ListReposServiceProtocol {
    
    private let baseUrl = "https://api.github.com"
    
    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 30
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    func fetchRepos(pagination: Int, onComplete: @escaping ((Result<[Repo], APIError>) -> Void)) {
        
        guard let url = URL(string: "\(baseUrl)/search/repositories?q=language:swift&sort=stars&per_page=20&page=\(pagination)") else {
            return onComplete(.failure(.badURL))
        }
        print("Resquet URL: \(url.absoluteString)")
        
        let session = URLSession(configuration: ListReposService.configuration)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let listReposResponse = try JSONDecoder().decode(ListReposResponse.self, from: data)
                let repos = listReposResponse.items.map {Repo(from: $0)}
                onComplete(.success(repos))
            } catch {
                return onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
}
