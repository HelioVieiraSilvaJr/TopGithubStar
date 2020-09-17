//
//  ListReposResponse.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import Foundation

struct ListReposResponse: Decodable {
    let items: [Item]
    
    struct Item: Decodable {
        let name: String
        let stargazersCount: Int
        let htmlUrl: String
        let owner: Owner
        
        enum CodingKeys: String, CodingKey {
            case name, owner
            case htmlUrl = "html_url"
            case stargazersCount = "stargazers_count"
        }
        
        struct Owner: Decodable {
            let login: String
            let avatarUrl: String
            
            enum CodingKeys: String, CodingKey {
                case login
                case avatarUrl = "avatar_url"
            }
        }
    }
}
