//
//  SeasonsViewController.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import UIKit

class SeasonsViewController: UIViewController {
    
    var presenter: SeasonsPresenterInput?
    var league: League?
    
    private var seasons: [Season] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(SeasonTableViewCell.self, forCellReuseIdentifier: Constants.Seasons.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.Seasons.title
        addSubviews()
        makeConstraints()
        tableView.rowHeight = Constants.Seasons.rowHeight
        
        guard let league = league else {
            return
        }
        presenter?.loadData(for: league)
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

extension SeasonsViewController: SeasonsView {
    func displaySeasons(seasons: [Season]) {
        self.seasons = seasons
        tableView.reloadData()
    }
}

extension SeasonsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = seasons.isEmpty
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Seasons.cellIdentifier, for: indexPath) as? SeasonTableViewCell
        cell?.configure(model: seasons[indexPath.row])
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
        return cell ?? UITableViewCell()
    }
}

extension SeasonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = StandingsViewController()
        let presenter = StandingsPresenter(view: viewController)
        viewController.presenter = presenter
        viewController.league = league
        viewController.season = String(seasons[indexPath.row].year)
        viewController.seasons = seasons
        navigationController?.pushViewController(viewController, animated: true)
    }
}
