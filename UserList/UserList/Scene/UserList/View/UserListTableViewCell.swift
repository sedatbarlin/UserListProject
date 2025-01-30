//
//  UserListTableViewCell.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import UIKit
import SnapKit

class UserListTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    private lazy var nameLabel = makeNameLabel()
    private lazy var emailLabel = makeEmailLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
        }
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
        }
    }
    
    private func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }
    
    private func makeEmailLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }
    
    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
