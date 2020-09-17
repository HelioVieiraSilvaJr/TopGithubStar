//
//  ListReposViewCodeViewController.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

final class ListReposViewCodeViewController: UIViewController, HasCodeView {
    
    typealias CustomView = ListReposViewCode
    
    // MARK: Properties
    var viewModel = ListReposViewModel()
    private var refreshControl = UIRefreshControl()
    
    // MARK: Overrides
    override func loadView() {
        view = ListReposViewCode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bindEvents()
        viewModel.fetchRepos()
    }
    
    // MARK: Helpers
    private func bindEvents() {
        viewModel.shouldUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.customView.tableView.reloadData()
            }
        }
    }
    
    private func setup() {
        title = "Version - ViewCode"
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        customView.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(reloadRepos), for: .valueChanged)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let barButtonItemChangeVC = UIBarButtonItem(title: "Storyboard", style: .plain, target: self, action: #selector(changeViewController))
        navigationItem.rightBarButtonItem = barButtonItemChangeVC
    }
    
    @objc private func reloadRepos() {
        viewModel.reloadRepos()
    }
    
    @objc private func changeViewController() {
        (UIApplication.shared.delegate as? AppDelegate)?.setRootViewController(.storyboard)
    }
}

// MARK: Extensions
extension ListReposViewCodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepoViewCodeCell.identifier) as? RepoViewCodeCell else {
            return UITableViewCell()
        }
        let repo = viewModel.repos[indexPath.row]
        cell.configure(with: repo)
        return cell
    }
}

extension ListReposViewCodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row > 0 else {return}
        let indexNeedFetchNewRepos = viewModel.repos.count - 1
        
        if indexPath.row >= indexNeedFetchNewRepos {
            viewModel.fetchRepos()
        }
    }
}
