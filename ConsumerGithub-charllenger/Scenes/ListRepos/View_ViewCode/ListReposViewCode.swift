//
//  ListReposViewCode.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

final class ListReposViewCode: BaseView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 8
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RepoViewCodeCell.self, forCellReuseIdentifier: RepoViewCodeCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func initialize() {
        addSubview(tableView)
    }
    
    override func installConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
