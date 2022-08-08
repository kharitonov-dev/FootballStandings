//
//  League.swift
//  FootballStandings
//
//  Created by Timofey Kharitonov on 07.08.2022.
//

struct League: Codable {
    let id, name, slug, abbr: String
    let logos: Logo
}
