//
//  StandingsPresenterInput.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import Foundation

protocol StandingsPresenterInput: AnyObject {
    func loadData(for league: League, season: String)
}
