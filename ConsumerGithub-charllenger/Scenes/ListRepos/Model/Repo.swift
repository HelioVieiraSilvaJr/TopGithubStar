//
//  Repo.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation

struct Repo: Decodable {
    let name: String
    let stars: Int
    let photoAuthor: String
    let nameAuthor: String
    let urlGithub: String
    
    init(from item: ListReposResponse.Item) {
        name = item.name
        stars = item.stargazersCount
        photoAuthor = item.owner.avatarUrl
        nameAuthor = item.owner.login
        urlGithub = item.htmlUrl
    }
}
