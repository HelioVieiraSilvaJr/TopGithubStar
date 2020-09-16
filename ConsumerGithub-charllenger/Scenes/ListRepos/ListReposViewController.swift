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
            tableView.delegate = self
            tableView.register(UINib(nibName: RepoCell.identifier, bundle: nil), forCellReuseIdentifier: RepoCell.identifier)
        }
    }
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindEvents()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.identifier) as? RepoCell else {
            return UITableViewCell()
        }
        let repo = viewModel.repos[indexPath.row]
        cell.configure(with: repo)
        return cell
    }
}

extension ListReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard indexPath.row > 0 else {return}
        
        let indexNeedFetchNewRepos = viewModel.repos.count - 1
        
        if indexPath.row >= indexNeedFetchNewRepos {
            viewModel.fetchRepos()
        }
    }
}
