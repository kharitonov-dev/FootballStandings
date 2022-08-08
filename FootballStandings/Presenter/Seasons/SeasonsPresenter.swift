//
//  SeasonsPresenter.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import Foundation

final class SeasonsPresenter: SeasonsPresenterInput {
    weak var view: SeasonsView?
    private let model = GetModels()
    
    init(view: SeasonsView) {
        self.view = view
    }
    
    func loadData(for league: League) {
        model.getSeasons(for: league.id) { [weak self] seasons in
            DispatchQueue.main.async {
                self?.view?.displaySeasons(seasons: seasons)
            }
        }
    }
}
