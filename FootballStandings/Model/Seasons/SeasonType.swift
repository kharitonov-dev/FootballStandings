//
//  SeasonType.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct SeasonType: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}
