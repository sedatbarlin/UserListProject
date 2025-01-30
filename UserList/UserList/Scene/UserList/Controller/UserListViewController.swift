//
//  UserListViewController.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import UIKit

class UserListViewController: UIViewController {
    
    private let viewModel = UsersViewModel()
    private var userListTableView: UserListTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.delegate = self
        viewModel.fetchUsers()
    }
    
    private func setupUI() {
        title = "Users"
        view.backgroundColor = .white
        configureTableView()
    }
    
    private func configureTableView() {
        userListTableView = UserListTableView(viewModel: viewModel)
        userListTableView.userDelegate = self
        
        view.addSubview(userListTableView)
        userListTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().offset(16)
        }
    }
}

// ViewModel'den gelen güncellemeleri handle ettiğim extension
extension UserListViewController: UsersViewModelDelegate {
    func didUpdateUsers() {
        userListTableView.reloadData()
    }
}

// TableView'dan gelen kullanıcı seçimlerini handle ettiğim extension
extension UserListViewController: UserListTableViewDelegate {
    func userListTableView(_ tableView: UserListTableView, didSelectUser user: User) {
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
