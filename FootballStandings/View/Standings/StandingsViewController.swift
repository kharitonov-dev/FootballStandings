//
//  StandingsViewController.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import UIKit

class StandingsViewController: UIViewController {
    
    var presenter: StandingsPresenterInput?
    var league: League?
    var season: String = ""
    var seasons: [Season] = []
    
    private var standings: [Standing] = []
    
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(StandingCell.self, forCellReuseIdentifier: Constants.Standings.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.Standings.title
        addSubviews()
        makeConstraints()
        tableView.rowHeight = Constants.Standings.rowHeight
        
        guard let league = league else {
            return
        }
        presenter?.loadData(for: league, season: season)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.Standings.btnTitleRightNavigation, style: .plain, target: self, action: #selector(showSeasons))
    }
    
    @objc private func showSeasons() {
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
                
        toolBar = UIToolbar(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: Constants.Standings.btnTitleToolBar, style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc private func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
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

extension StandingsViewController: StandingsView {
    func displayStandings(standings: [Standing]) {
        self.standings = standings
        tableView.reloadData()
    }
}

extension StandingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = standings.isEmpty
        return standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Standings.cellIdentifier, for: indexPath) as? StandingCell
        cell?.configure(model: standings[indexPath.row])
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
        return cell ?? UITableViewCell()
    }
}

extension StandingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return seasons.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(seasons[row].year)
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let league = league else {
            return
        }
        presenter?.loadData(for: league, season: String(seasons[row].year))
    }
}
