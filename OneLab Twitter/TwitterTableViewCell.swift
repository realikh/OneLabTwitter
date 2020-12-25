//
//  TwitterTableViewCell.swift
//  OneLab Twitter
//
//  Created by Alikhan Khassen on 24.12.2020.
//

import SnapKit

class TwitterTableViewCell: UITableViewCell {

    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    let twitterTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAvatarImageView()
        configureUsernameLabel()
        configureTwitterTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAvatarImageView() {
        contentView.addSubview(avatarImageView)
        avatarImageView.backgroundColor = .darkGray
        avatarImageView.layer.cornerRadius = 35
        avatarImageView.snp.makeConstraints {
            $0.left.equalTo(contentView).offset(15)
            $0.top.equalTo(contentView).offset(15)
            $0.bottom.lessThanOrEqualToSuperview().offset(-15)
            $0.width.equalTo(70)
            $0.height.equalTo(70)
        }
    }
    
    private func configureUsernameLabel() {
        usernameLabel.font = .systemFont(ofSize: 19, weight: .medium)
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).offset(15)
            $0.top.equalTo(contentView).offset(15)
            $0.right.equalTo(contentView).offset(-15)
        }
    }
    
    private func configureTwitterTextLabel() {
        contentView.addSubview(twitterTextLabel)
        twitterTextLabel.numberOfLines = 0
        
        twitterTextLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).offset(15)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(5)
            $0.right.equalTo(contentView).offset(-15)
            $0.bottom.lessThanOrEqualToSuperview().offset(-15)
        }
    }
}
