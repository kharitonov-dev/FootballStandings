//
//  Seasons.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct Seasons: Decodable {
    let name: String?
    let description: String?
    let abbreviation: String?
    let seasons: [Season]
}
