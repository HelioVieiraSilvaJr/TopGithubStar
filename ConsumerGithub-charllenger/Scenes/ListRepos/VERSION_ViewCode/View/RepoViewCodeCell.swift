//
//  RepoViewCodeCell.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 17/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit
import Kingfisher

class RepoViewCodeCell: UITableViewCell {

    static let identifier = "RepoViewCodeCell"
    
    // MARK: Views
    var ivPhotoAuthor: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let lblNameRepository: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblNameAuthor: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        label.contentHuggingPriority(for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblStars: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colunmStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        ivPhotoAuthor.image = nil
        lblNameRepository.text = nil
        lblNameAuthor.text = nil
        lblStars.text = nil
    }
    
    // MARK: Initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(ivPhotoAuthor)
        addSubview(colunmStackView)
        colunmStackView.addArrangedSubview(lblNameRepository)
        colunmStackView.addArrangedSubview(lblNameAuthor)
        addSubview(lblStars)
        
        installConstraints()
    }
    
    private func installConstraints() {
        let paddingLeft: CGFloat = 15
        let paddingRight: CGFloat = 15
        let paddingTop: CGFloat = 10
        let paddingBottom: CGFloat = 10
        
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        ivPhotoAuthor.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingLeft).isActive = true
        ivPhotoAuthor.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ivPhotoAuthor.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ivPhotoAuthor.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblStars.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -paddingRight).isActive = true
        lblStars.widthAnchor.constraint(equalToConstant: 80).isActive = true
        lblStars.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        colunmStackView.leadingAnchor.constraint(equalTo: ivPhotoAuthor.trailingAnchor, constant: 8).isActive = true
        colunmStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop).isActive = true
        colunmStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddingBottom).isActive = true
        colunmStackView.trailingAnchor.constraint(equalTo: lblStars.leadingAnchor, constant: 10).isActive = true
    }
    
    // MARK: Configure
    func configure(with repo: Repo) {
        setImageWith(repo.photoAuthor)
        lblNameRepository.text = repo.name
        lblNameAuthor.text = repo.nameAuthor
        lblStars.text = "⭐️ \(repo.stars)"
    }
    
    // MARK: Helpers
    private func setImageWith(_ urlString: String) {
        if let url = URL(string: urlString) {
            ivPhotoAuthor.kf.setImage(with: url)
        }
    }
}
