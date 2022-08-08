//
//  LeaguesViewController.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import UIKit

class LeaguesViewController: UIViewController {

    var presenter: LeaguesPresenterInput?
    
    private var leagues: [League] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(LeagueTableViewCell.self, forCellReuseIdentifier: ConstantsLeagues.Cell.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = ConstantsLeagues.Table.title
        addSubviews()
        makeConstraints()
        tableView.rowHeight = ConstantsLeagues.Table.rowHeight
        presenter?.loadData()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        let constraints = [
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension LeaguesViewController: LeaguesView {
    func displayLeague(leagues: [League]) {
        self.leagues = leagues
        tableView.reloadData()
    }
}

extension LeaguesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = leagues.isEmpty
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsLeagues.Cell.cellIdentifier, for: indexPath) as? LeagueTableViewCell
        cell?.configure(model: leagues[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = SeasonsViewController()
        let presenter = SeasonsPresenter(view: viewController)
        viewController.presenter = presenter
        viewController.league = leagues[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
