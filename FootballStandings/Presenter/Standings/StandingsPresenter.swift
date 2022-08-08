//
//  StandingsPresenter.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import Foundation

final class StandingsPresenter: StandingsPresenterInput {
    weak var view: StandingsView?
    private let model = GetModels()
    
    init(view: StandingsView) {
        self.view = view
    }
    
    func loadData(for league: League, season: String) {
        model.getStandings(for: league.id, season: season) { [weak self] standings in
            DispatchQueue.main.async {
                self?.view?.displayStandings(standings: standings)
            }
        }
    }
}
