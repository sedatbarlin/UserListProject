//
//  UserListTableView.swift
//  UserList
//
//  Created by Sedat on 30.01.2025.
//

import UIKit

protocol UserListTableViewDelegate: AnyObject {
    func userListTableView(_ tableView: UserListTableView, didSelectUser user: User)
}

class UserListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    private var viewModel: UsersViewModel
    weak var userDelegate: UserListTableViewDelegate?

    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
        separatorStyle = .singleLine
        separatorInset = .zero
        rowHeight = 70
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        tableHeaderView = UIView(frame: .zero)
        tableFooterView = UIView(frame: .zero)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.getUser(at: indexPath.row)
        cell.configure(with: user)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.getUser(at: indexPath.row)
        userDelegate?.userListTableView(self, didSelectUser: user)
    }
}
