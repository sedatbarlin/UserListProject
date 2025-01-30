//
//  UserDetailViewController.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import UIKit
import SnapKit

class UserDetailViewController: UIViewController {
    
    private let user: User
    private lazy var profileImageView = makeProfileImageView()
    private lazy var nameLabel = makeNameLabel()
    private lazy var emailLabel = makeDetailLabel()
    private lazy var phoneLabel = makeDetailLabel()
    private lazy var websiteLabel = makeDetailLabel()
    private lazy var detailsContainer = UIView()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        detailsContainer.backgroundColor = .systemBackground
        detailsContainer.layer.cornerRadius = 12
        detailsContainer.layer.shadowColor = UIColor.black.cgColor
        detailsContainer.layer.shadowOpacity = 0.1
        detailsContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        detailsContainer.layer.shadowRadius = 5
        view.addSubview(detailsContainer)
        detailsContainer.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(150)
        }
        
        let stackView = UIStackView(arrangedSubviews: [emailLabel, phoneLabel, websiteLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        detailsContainer.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
    }
    
    private func makeProfileImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .gray
        return imageView
    }
    
    private func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 22)
        label.textAlignment = .center
        return label
    }
    
    private func makeDetailLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 16)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }
    
    // Kullanıcı verilerini UI bileşenlerine atamak için metod
    private func configureData() {
        nameLabel.text = user.name
        emailLabel.text = "📧 \(user.email)"
        phoneLabel.text = "📞 \(user.phone)"
        websiteLabel.text = "🌍 \(user.website)"
    }
}
