//
//  Standing.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct Standing: Decodable {
    let team: Team
    let note: Note?
    let stats: [Stat]
}
