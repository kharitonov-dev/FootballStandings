//
//  Season.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 08.08.2022.
//

struct Season: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [SeasonType]
}
