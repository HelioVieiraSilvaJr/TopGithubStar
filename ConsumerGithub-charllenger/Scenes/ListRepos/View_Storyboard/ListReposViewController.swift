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
    var viewModel = ListReposViewModel()
    private var refreshControl = UIRefreshControl()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: RepoCell.identifier, bundle: nil), forCellReuseIdentifier: RepoCell.identifier)
            tableView.refreshControl?.addTarget(self, action: #selector(reloadRepos), for: .valueChanged)
            tableView.refreshControl = refreshControl
        }
    }
    
    // MARK: Overrides
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
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setup() {
        title = "Version - Storyboard"
        navigationController?.navigationBar.prefersLargeTitles = true
        let barButtonItemChangeVC = UIBarButtonItem(title: "ViewCode",
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(changeViewController))
        navigationItem.rightBarButtonItem = barButtonItemChangeVC
        refreshControl.addTarget(self, action: #selector(reloadRepos), for: .valueChanged)
    }
    
    @objc private func reloadRepos() {
        viewModel.reloadRepos()
    }
    
    @objc private func changeViewController() {
        (UIApplication.shared.delegate as? AppDelegate)?.setRootViewController(.viewCode)
    }
}

// MARK: Extensions
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = viewModel.repos[indexPath.row]
        if let url = URL(string: repo.urlGithub) {
            UIApplication.shared.open(url)
        }
    }
}
