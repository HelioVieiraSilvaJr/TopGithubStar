//
//  ListReposViewController.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

final class ListReposViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel = ListReposViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
        }
    }
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchRepos()
    }
    
    // MARK: Helpers
    private func bindEvents() {
        viewModel.shouldUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension ListReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let repo = viewModel.repos[indexPath.row]
        print("==> REPO: \(repo)")
        
        return UITableViewCell()
    }
}
