//
//  StandingsView.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

import Foundation

protocol StandingsView: AnyObject {
    func displayStandings(standings: [Standing])
}
