//
//  ListReposViewModel.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation

final class ListReposViewModel {
    
    private let service: ListReposServiceProtocol!
    private var pagination: Int = 1
    var repos: [Repo] = []
    
    var shouldUpdate: (() -> Void)?
    
    init(_ service: ListReposServiceProtocol = ListReposService()) {
        self.service = service
    }
    
    func fetchRepos() {
        service.fetchRepos(pagination: pagination) { [weak self] (result) in
            switch result {
            case .success(let repos):
                self?.repos.append(contentsOf: repos)
                self?.pagination += 1
                self?.shouldUpdate?()
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func reloadRepos() {
        pagination = 1
        fetchRepos()
    }
}
