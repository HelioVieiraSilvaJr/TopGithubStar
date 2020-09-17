//
//  RepoViewCodeCell.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit

class RepoViewCodeCell: UITableViewCell {

    static let identifier = "RepoViewCodeCell"
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Helio"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        addSubview(nameLabel)
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installConstraints() {
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    // MARK: Configure
    func configure(with repo: Repo) {
//        setImageWith(repo.photoAuthor)
//        lblNameRepository.text = repo.name
//        lblNameAuthor.text = repo.nameAuthor
//        lblStars.text = "⭐️ \(repo.stars)"
    }
    
    // MARK: Helpers
    private func setImageWith(_ urlString: String) {
//        if let url = URL(string: urlString) {
//            ivPhotoAuthor.kf.setImage(with: url)
//        }
    }
}
