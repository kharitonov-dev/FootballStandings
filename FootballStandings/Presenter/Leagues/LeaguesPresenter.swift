//
//  LeaguesPresenter.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

import Foundation

final class LeaguesPresenter: LeaguesPresenterInput {
    
    weak var view: LeaguesView?
    private let model = GetModels()
    
    init(view: LeaguesView) {
        self.view = view
    }
    
    func loadData() {
        model.getLeagues { [weak self] leagues in
            DispatchQueue.main.async {
                self?.view?.displayLeague(leagues: leagues)
            }
        }
    }
    
}
