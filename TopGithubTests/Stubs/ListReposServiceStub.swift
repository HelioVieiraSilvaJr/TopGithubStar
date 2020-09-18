//
//  ListReposServiceStub.swift
//  TopGithubTests
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation
@testable import TopGithub

class ListReposServiceStub: NSObject, ListReposServiceProtocol {
    
    func fetchRepos(pagination: Int, onComplete: @escaping ((Result<[Repo], APIError>) -> Void)) {
        var repos: [Repo] = []
        let url = Bundle(for: ListReposServiceStub.self).url(forResource: "listReposResponse", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let listReposResponse = try! JSONDecoder().decode(ListReposResponse.self, from: data)
        repos = listReposResponse.items.map { Repo(from: $0) }
        onComplete(.success(repos))
    }
}
