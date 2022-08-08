//
//  StandingsResponse.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct StandingsResponse: Decodable {
    let status: Bool
    let data: Standings
}
