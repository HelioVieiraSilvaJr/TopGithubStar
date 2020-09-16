//
//  RepoCell.swift
//  ConsumerGithub-charllenger
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 HelioTecnologia. All rights reserved.
//

import UIKit
import Kingfisher

class RepoCell: UITableViewCell {
    
    static let identifier = "RepoCell"

    // MARK: Outlets
    @IBOutlet weak var ivPhotoAuthor: UIImageView!
    @IBOutlet weak var lblNameRepository: UILabel!
    @IBOutlet weak var lblNameAuthor: UILabel!
    @IBOutlet weak var lblStars: UILabel!
    
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPhotoAuthor.layer.cornerRadius = ivPhotoAuthor.frame.width / 2
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        ivPhotoAuthor.image = nil
        lblNameRepository.text = nil
        lblNameAuthor.text = nil
        lblStars.text = nil
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
