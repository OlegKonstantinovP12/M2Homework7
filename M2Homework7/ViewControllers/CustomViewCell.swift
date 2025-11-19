//
//  CustomViewCell.swift
//  M2Homework7
//
//  Created by Oleg Konstantinov on 18.11.2025.
//

import UIKit

class CustomViewCell: UITableViewCell {
    private lazy var userNameLabel = setupLabels()
    private lazy var avatarImageView = setupImageView(radius: 17.5)
    private lazy var postImageView = setupImageView(radius: 21)
    private lazy var dateLabel = setupLabels(font: .interType(fontType: .bold, size: 12))
    private lazy var descriptionLabel = setupLabels(font: .interType(fontType: .regular, size: 14))
    private lazy var cellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .brightGray
        return $0
    }(UIView())


    private func setupLabels(font: UIFont = .interType(fontType: .regular, size: 16)) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = font
        return label
    }
    
    private func setupImageView(radius: CGFloat) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = radius
        return image
    }
  
    
    func setupCell(item: Post) {
        userNameLabel.text = item.username
        avatarImageView.image = UIImage(named: item.avatar)
        postImageView.image = UIImage(named: item.image)
        dateLabel.text = item.date
        descriptionLabel.text = item.description
        
        contentView.addSubview(cellView)
        cellView.addSubview(avatarImageView)
        cellView.addSubview(userNameLabel)
        cellView.addSubview(postImageView)
        cellView.addSubview(dateLabel)
        cellView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 35),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1),
            avatarImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 14),
            avatarImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 14),
            
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            userNameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 22),
            userNameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -14),
            
            postImageView.heightAnchor.constraint(equalToConstant: 200),
            postImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 14),
            postImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -14),
            postImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 11),
            
            dateLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 32),
            dateLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -14),
            dateLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 6),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 14),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -14),
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 14),
            descriptionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -14)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
