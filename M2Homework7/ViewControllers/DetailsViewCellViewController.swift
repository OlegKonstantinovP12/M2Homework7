//
//  DetailsViewCellViewController.swift
//  M2Homework7
//
//  Created by Oleg Konstantinov on 18.11.2025.
//

import UIKit

class DetailsViewCellViewController: UIViewController {

    var posts: Post
    
    init(posts: Post) {
        self.posts = posts
        super.init(nibName: nil, bundle: nil)
    }
    
        
    private lazy var avatarImageView = setupImageView(image: posts.avatar, size: .avatar)
    private lazy var usernameLabel = setupLabel(
        text: posts.username,
        font: .interType(fontType: .bold, size: 16),
        textAlignment: .center
    )
    
    private lazy var postImageView = setupImageView(image: posts.image, size: .post)
    private lazy var descriptionLabel = setupLabel(text: posts.description)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(postImageView)
        view.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - UIImageView method
extension DetailsViewCellViewController {
    private func setupImageView(image: String, size: sizeImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        switch size {
        case .avatar:
            imageView.layer.cornerRadius = 30
        case .post:
            imageView.layer.cornerRadius = 21
        }
        return imageView
    }
}

//MARK: - UILabel method
extension DetailsViewCellViewController {
    private func setupLabel(text: String, font: UIFont = .interType(fontType: .regular, size: 16), textAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = text
        label.font = font
        label.textAlignment = textAlignment
        return label
    }
}
//MARK: - Constraints
extension DetailsViewCellViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15),
            
            postImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postImageView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 42),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 34)
        ])
    }
}
