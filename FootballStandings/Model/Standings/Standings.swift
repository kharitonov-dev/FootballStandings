//
//  Standings.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct Standings: Decodable {
    let name: String
    let abbreviation: String
    let seasonDisplay: String
    let season: Int?
    let standings: [Standing]
}
